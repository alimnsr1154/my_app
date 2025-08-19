import 'package:auto_route/auto_route.dart';
import 'package:my_app/app/ui/pages/basic_information_view.dart';
import 'package:my_app/app/ui/pages/home_view.dart';
import 'package:my_app/app/ui/pages/products_view.dart';
import 'package:my_app/app/ui/pages/profile_view.dart';
import 'package:my_app/app/ui/pages/set_password_view.dart';
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
    AutoRoute(page: ProfileRoute.page),
    AutoRoute(page: SetPasswordRoute.page),
    AutoRoute(page: BasicInformationRoute.page),
    AutoRoute(page: ProductsRoute.page),
  ];
}
