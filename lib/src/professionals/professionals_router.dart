import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:salo/src/auth/domain/firebase_auth_extension.dart';
import 'package:salo/src/professionals/profile/profile_screen.dart';

import '../auth/auth_screen.dart';
import '../auth/signup_form/signup_form_screen.dart';
import 'home/home_screen.dart';
import 'onboarding/onboarding_screen.dart';

/// The route configuration.
final GoRouter professionalsRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      redirect: (context, state) async {
        // On first launch, redirect, then go to whatever the requested route is.
        if (state.uri.path == '/') {
          final currentUser = FirebaseAuth.instance.currentUser;
          final isLoggedIn = currentUser != null;
          if (!isLoggedIn) {
            return '/onboarding';
          }

          final isSignUpComplete = (await currentUser.isSignUpComplete);
          debugPrint('isSignUpComplete: $isSignUpComplete');
          return isSignUpComplete ? '/home' : '/signup';
        }
        return null;
      },
      routes: [
        GoRoute(
          path: 'home',
          builder: (BuildContext context, GoRouterState state) {
            return const HomeScreen();
          },
          routes: [
            GoRoute(
              path: 'profile',
              builder: (BuildContext context, GoRouterState state) {
                return ProfileScreen();
              },
            ),
          ],
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
);
