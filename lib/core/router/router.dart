import 'package:auto_route/auto_route.dart';
import 'package:iotools/core/router/home_guard.dart';
import 'package:iotools/core/router/router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: HomeRoute.page, initial: true, guards: [HomeGuard()]),
    AutoRoute(page: LoginRoute.page, path: '/login'),
    AutoRoute(page: RegistrationRoute.page, path: '/registration'),
    AutoRoute(page: IntroduceRoute.page, path: '/introduce'),
    AutoRoute(page: RoomsRoute.page, path: '/rooms'),
    AutoRoute(page: AddRoomRoute.page, path: '/add_room'),
    AutoRoute(page: SensorAlertRoute.page, path: '/notification'),
    AutoRoute(page: DetectorRoute.page, path: '/detector'),
  ];
}
