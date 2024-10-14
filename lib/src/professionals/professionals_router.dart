import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:salo/src/auth/phone_validation_screen.dart';

import '../auth/auth_screen.dart';
import '../auth/signup_form_screen.dart';
import 'onboarding/onboarding_screen.dart';

/// The route configuration.
final GoRouter professionalsRouter = GoRouter(
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
          builder: (BuildContext context, GoRouterState state) {
            return const AuthScreen();
          },
        ),
        GoRoute(
          path: 'onboarding',
          builder: (BuildContext context, GoRouterState state) {
            return const OnboardingScreen();
          },
        ),
        GoRoute(
          path: 'auth',
          builder: (BuildContext context, GoRouterState state) {
            return const AuthScreen();
          },
          routes: [
            GoRoute(
              path: 'verify',
              builder: (BuildContext context, GoRouterState state) {
                return PhoneValidationScreen(
                  phoneNumber: state.extra as String,
                );
              },
            ),
            GoRoute(
              path: 'signup',
              builder: (BuildContext context, GoRouterState state) {
                return const SignupFormScreen();
              },
            ),
          ],
        ),
      ],
    ),
  ],
);
