import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../professionals/onboarding/onboarding_screen.dart';

/// The route configuration.
final GoRouter servicesRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      redirect: (context, state) {
        // On first launch, redirect, then go to whatever the requested route is.
        if (state.uri.path == '/') {
          final currentUser = FirebaseAuth.instance.currentUser;
          final isAuthenticated = currentUser != null;
          return isAuthenticated ? '/home' : '/onboarding';
        }
        return null;
      },
      routes: [
        GoRoute(
          path: 'home',
          onExit: (_, __) => FirebaseAuth.instance.currentUser == null,
          builder: (BuildContext context, GoRouterState state) {
            return const OnboardingScreen();
          },
        ),
        GoRoute(
          path: 'onboarding',
          onExit: (_, __) => FirebaseAuth.instance.currentUser != null,
          builder: (BuildContext context, GoRouterState state) {
            return const OnboardingScreen();
          },
        ),
      ],
    ),
  ],
);
