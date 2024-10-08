import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:salo/app.dart';
import 'package:salo/src/professionals/professionals_router.dart';

import 'firebase_options.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await FirebaseMessaging.instance.setAutoInitEnabled(true);

  runApp(
    SaloApp(
      title: 'Salo Pro',
      router: professionalsRouter,
    ),
  );
}
