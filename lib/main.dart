import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iotools/bloc/auth/auth_bloc.dart';
import 'package:iotools/bloc/detectors/detectors_bloc.dart';
import 'package:iotools/bloc/introduce/introduce_bloc.dart';
import 'package:iotools/bloc/room/room_bloc.dart';
import 'package:iotools/bloc/sensor/sensor_cubit.dart';
import 'package:iotools/bloc/user/user_bloc.dart';
import 'package:iotools/core/router/router.dart';
import 'package:iotools/core/theme/theme.dart';
import 'package:iotools/init_dependecies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => serviceLocator<AuthBloc>()),
        BlocProvider(create: (context) => serviceLocator<IntroduceBloc>()),
        BlocProvider(create: (context) => serviceLocator<RoomBloc>()),
        BlocProvider(create: (context) => serviceLocator<UserBloc>()),
        BlocProvider(create: (context) => serviceLocator<DetectorsBloc>()),
        BlocProvider(create: (context) => serviceLocator<SensorCubit>()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize our router
    final appRouter = AppRouter();
    return MaterialApp.router(
      routerConfig: appRouter.config(),
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
    );
  }
}
