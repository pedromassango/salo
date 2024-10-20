import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salo/app.dart';
import 'package:salo/src/auth/auth_screen_cubit.dart';
import 'package:salo/src/auth/domain/save_fcm_token_interactor.dart';
import 'package:salo/src/auth/domain/send_otp_usecase.dart';
import 'package:salo/src/professionals/home/home_screen_cubit.dart';
import 'package:salo/src/professionals/professionals_router.dart';
import 'package:salo/src/professionals/profile/profile_screen_cubit.dart';
import 'package:salo/src/shared/resources.dart';

import 'firebase_options_pro.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  //await FirebaseAuth.instance.signOut();
  await FirebaseMessaging.instance.setAutoInitEnabled(true);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthScreenCubit(
            sendOtpUsecase: SendOtpUsecase(),
          ),
        ),
        BlocProvider(
          create: (_) => HomeScreenCubit(
            saveFcmTokenInteractor: SaveFcmTokenInteractor(),
          ),
        ),
        BlocProvider(create: (_) => ProfileScreenCubit()),
      ],
      child: SaloApp(
        title: '$appName Pro',
        router: professionalsRouter,
      ),
    ),
  );
}
