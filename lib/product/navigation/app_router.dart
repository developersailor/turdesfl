import 'package:auto_route/auto_route.dart';
import 'package:turdes/product/navigation/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
/// Project router information class
final class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material(); //.cupertino, .adaptive ..etc

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: LoginRoute.page, initial: true),
    AutoRoute(page: HomeRoute.page, path: '/home'),
    AutoRoute(page: AidrequestsRoute.page, path: '/aidrequestview'),
    AutoRoute(page: RegisterRoute.page, path: '/register'),
    AutoRoute(page: ProfileRoute.page, path: '/profile'),
    AutoRoute(page: AidRequestDetailRoute.page, path: '/aidrequestdetail'),
  ];

  @override
  List<AutoRouteGuard> get guards => [
    // optionally add root guards here
  ];
}
