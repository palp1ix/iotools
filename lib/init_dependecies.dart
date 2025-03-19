import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:iotools/bloc/auth/auth_bloc.dart';
import 'package:iotools/bloc/introduce/introduce_bloc.dart';
import 'package:iotools/core/service/auth_service.dart';
import 'package:iotools/data/model/datasource/remote/remote_datasoure.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  await AuthService().initializeUser();
  serviceLocator.registerSingleton<Dio>(Dio());
  serviceLocator.registerFactory(() => RemoteDatasoure(serviceLocator()));
  serviceLocator.registerFactory(() => AuthBloc(serviceLocator()));
  serviceLocator.registerFactory(() => IntroduceBloc(serviceLocator()));
}
