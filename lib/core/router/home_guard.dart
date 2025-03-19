import 'package:auto_route/auto_route.dart';
import 'package:iotools/core/router/router.gr.dart';
import 'package:iotools/core/service/auth_service.dart';

class HomeGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final authService = AuthService();

    if (authService.isAuntificated) {
      resolver.next(true);
    } else {
      resolver.redirectUntil(IntroduceRoute());
    }
  }
}
