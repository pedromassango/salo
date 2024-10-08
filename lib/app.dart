import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';

const bool isProVersion = appFlavor == 'pro';

class SaloApp extends StatelessWidget {
  const SaloApp({
    super.key,
    this.title,
    required this.router,
  });

  final String? title;
  final GoRouter router;

  @override
  Widget build(BuildContext context) {
    print('IsPro: $isProVersion\n');
    return MaterialApp.router(
      title: title ?? 'Salo',
      routerConfig: router,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: GoogleFonts.roboto().fontFamily,
        textTheme: TextTheme(
          displayLarge: GoogleFonts.baloo2(),
          headlineLarge: GoogleFonts.baloo2(),
          titleSmall: GoogleFonts.roboto(),
          titleMedium: GoogleFonts.roboto(),
          titleLarge: GoogleFonts.roboto(
            fontWeight: FontWeight.w900,
          ),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
        ),
      ),
    );
  }
}
