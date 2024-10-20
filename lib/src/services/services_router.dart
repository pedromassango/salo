import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:salo/src/services/main/main_screen.dart';

import '../professionals/onboarding/onboarding_screen.dart';

/// The route configuration.
final servicesRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      redirect: (context, state) => '/main',
      routes: [
        GoRoute(
          path: 'main',
          builder: (_, __) => const MainScreen(),
        ),
        GoRoute(
          path: 'onboarding',
          builder: (BuildContext context, GoRouterState state) {
            return const OnboardingScreen();
          },
        ),
      ],
    ),
  ],
);
