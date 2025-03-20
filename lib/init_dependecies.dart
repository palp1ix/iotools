import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:iotools/bloc/auth/auth_bloc.dart';
import 'package:iotools/bloc/detectors/detectors_bloc.dart';
import 'package:iotools/bloc/introduce/introduce_bloc.dart';
import 'package:iotools/bloc/room/room_bloc.dart';
import 'package:iotools/bloc/sensor/sensor_cubit.dart';
import 'package:iotools/bloc/user/user_bloc.dart';
import 'package:iotools/core/service/auth_service.dart';
import 'package:iotools/data/datasource/remote/remote_datasoure.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';
import 'package:talker_flutter/talker_flutter.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  final dio = Dio();
  final talker = TalkerFlutter.init();
  serviceLocator.registerSingleton<Talker>(talker);
  final authService = AuthService();

  await authService.initializeUser();
  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) async {
        final token = await authService.initializeUser();
        options.headers['Authorization'] = 'Bearer $token';
        return handler.next(options);
      },
    ),
  );

  dio.interceptors.add(
    TalkerDioLogger(
      talker: talker,
      settings: const TalkerDioLoggerSettings(
        printRequestHeaders: true,
        printRequestData: true,
        printResponseHeaders: true,
        printResponseMessage: true,
      ),
    ),
  );
  serviceLocator.registerSingleton<Dio>(dio);
  serviceLocator.registerFactory(() => RemoteDatasoure(serviceLocator()));
  serviceLocator.registerFactory(() => AuthBloc(serviceLocator()));
  serviceLocator.registerFactory(() => IntroduceBloc(serviceLocator()));
  serviceLocator.registerFactory(() => RoomBloc(serviceLocator()));
  serviceLocator.registerFactory(() => UserBloc(serviceLocator()));
  serviceLocator.registerFactory(() => DetectorsBloc(serviceLocator()));
  serviceLocator.registerFactory(() => SensorCubit(serviceLocator()));
}
