import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart' hide Category;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:salo/src/auth/domain/firebase_collections.dart';
import 'package:salo/src/auth/domain/save_fcm_token_interactor.dart';
import 'package:salo/src/get_categories_usecase.dart';
import 'package:salo/src/professionals/domain/professional_user.dart';

part 'main_screen_cubit.freezed.dart';

class MainScreenCubit extends Cubit<MainScreenCubitState> {
  MainScreenCubit({
    required this.saveFcmTokenInteractor,
    required this.getCategoriesUsecase,
  }) : super(MainScreenCubitState());

  final GetCategoriesUsecase getCategoriesUsecase;
  final SaveFcmTokenInteractor saveFcmTokenInteractor;

  void init() {
    emit(MainScreenCubitState(isLoading: true));
    _listenToFCMTokenChanges();

    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      loadUserData(currentUser);
    }
  }

  var _listeningToFCMTokens = false;

  void _listenToFCMTokenChanges() async {
    //await UploadCategoriesUsecase().call();
    if (_listeningToFCMTokens) {
      return;
    }
    Permission.notification.isPermanentlyDenied.then((denied) {
      emit(state.copyWith(userShouldGrantNotificationPermission: denied));

      if (denied == false) {
        _listeningToFCMTokens = true;

        // Fetch and save token;
        unawaited(saveFcmTokenInteractor());

        // Listen for future changes
        FirebaseMessaging.instance.onTokenRefresh.listen((token) {
          saveFcmTokenInteractor(token: token);
        });
      }
    });
  }

  void loadUserData(User user) {
    getProUserDataDoc(user.uid).get().then((result) {
      final user = result.data();
      if (user == null) {
        debugPrint('Profile loading failed');
        emit(state.copyWith(
          isLoading: false,
          hasError: true,
        ));
        return;
      }

      emit(state.copyWith(
        isLoading: false,
        user: user,
      ));
    }).catchError((error, _) {
      debugPrint('Profile loading failed: $error');

      emit(state.copyWith(
        isLoading: false,
        hasError: true,
      ));
    });
  }
}

@freezed
class MainScreenCubitState with _$MainScreenCubitState {
  const MainScreenCubitState._();

  factory MainScreenCubitState({
    @Default(false) bool isLoading,
    @Default(false) bool hasError,
    bool? userShouldGrantNotificationPermission,
    ProfessionalUser? user,
  }) = _MainScreenCubitState;
}
