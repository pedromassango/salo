import 'package:auto_route/auto_route.dart';
import 'package:salo/src/services/services_router.gr.dart';

final servicesRouter = AppRouter();

@AutoRouterConfig(
  replaceInRouteName: 'Page|Screen|Dialog|Modal|View,Route',
)
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType {
    return const RouteType.custom(
      transitionsBuilder: TransitionsBuilders.noTransition,
      durationInMilliseconds: 0,
      reverseDurationInMilliseconds: 0,
    );
  }

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/',
          page: SplashRoute.page,
          guards: [],
          children: [
            AutoRoute(
              path: 'onboarding',
              page: OnboardingRoute.page,
              initial: true,
            ),
          ],
        ),
      ];
}
