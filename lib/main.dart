import 'package:flutter/material.dart';
import 'package:salo/app.dart';
import 'package:salo/src/services/services_router.dart';

void main() {
  runApp(
    SaloApp(
      router: servicesRouter,
    ),
  );
}
