import 'package:auto_route/auto_route.dart';
import 'package:my_app/app/ui/pages/home_view.dart';
import 'package:my_app/app/ui/pages/splash_view.dart';
part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();
  @override
  List<AutoRoute> get routes => [
    // Splash and Onboarding
    AutoRoute(initial: true, page: SplashRoute.page),
    AutoRoute(page: HomeRoute.page),
  ];
}
