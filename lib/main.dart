import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salo/app.dart';
import 'package:salo/src/auth/domain/save_fcm_token_interactor.dart';
import 'package:salo/src/get_categories_usecase.dart';
import 'package:salo/src/services/main/main_screen_cubit.dart';
import 'package:salo/src/services/main/profile/profile_page_cubit.dart';
import 'package:salo/src/services/main/requests/requests_page_cubit.dart';
import 'package:salo/src/services/services_router.dart';

import 'firebase_options.dart';
import 'src/services/main/home/home_page_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await FirebaseMessaging.instance.setAutoInitEnabled(true);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => MainScreenCubit(
            saveFcmTokenInteractor: SaveFcmTokenInteractor(),
            getCategoriesUsecase: GetCategoriesUsecase(),
          ),
        ),
        BlocProvider(
          create: (_) => HomePageCubit(
            getCategoriesUsecase: GetCategoriesUsecase(),
          ),
        ),
        BlocProvider(create: (_) => RequestsPageCubit()),
        BlocProvider(create: (_) => ProfilePageCubit()),
      ],
      child: SaloApp(
        router: servicesRouter,
      ),
    ),
  );
}
