import 'package:auto_route/auto_route.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../shared/gen/assets.gen.dart';
import '../../shared/resources.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static AutoRouteGuard guard() {
    return AutoRouteGuard.simple((resolver, stack) {
      /* final currentUser = FirebaseAuth.instance.currentUser;
      final isAuthenticated = currentUser != null;
      return isAuthenticated ? '/home' : '/onboarding';*/
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Stack(
        children: [
          Positioned.fill(
            child: Assets.coverrrrrr.image(fit: BoxFit.cover),
          ),
        ],
      ),
    );
  }
}
