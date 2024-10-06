import 'package:flutter/material.dart';
import 'package:salo/app.dart';
import 'package:salo/src/professionals/professionals_router.dart';
import 'package:salo/src/services/services_router.dart';

void main() {
  runApp(
    SaloApp(
      routerDelegate: servicesRouter.delegate(),
      routeInformationParser: professionalsRouter.defaultRouteParser(),
    ),
  );
}
