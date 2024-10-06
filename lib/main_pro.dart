import 'package:flutter/material.dart';
import 'package:salo/app.dart';
import 'package:salo/src/professionals/professionals_router.dart';

void main() {
  runApp(
    SaloApp(
      title: 'Salo Pro',
      routerDelegate: professionalsRouter.delegate(),
      routeInformationParser: professionalsRouter.defaultRouteParser(),
    ),
  );
}
