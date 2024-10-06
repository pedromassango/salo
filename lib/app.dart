import 'package:flutter/material.dart';
import 'package:salo/src/shared/resources.dart';

class SaloApp extends StatelessWidget {
  const SaloApp({
    super.key,
    this.title,
    required this.routerDelegate,
    required this.routeInformationParser,
  });

  final String? title;
  final RouterDelegate<Object> routerDelegate;
  final RouteInformationParser<Object> routeInformationParser;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: title ?? 'Salo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryColor,
        ),
        useMaterial3: true,
      ),
      routerDelegate: routerDelegate,
      routeInformationParser: routeInformationParser,
    );
  }
}
