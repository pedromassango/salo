import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart' hide Category;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:salo/src/auth/domain/firebase_collections.dart';
import 'package:salo/src/auth/domain/save_fcm_token_interactor.dart';
import 'package:salo/src/professionals/domain/professional_user.dart';

part 'home_screen_cubit.freezed.dart';

class HomeScreenCubit extends Cubit<HomeScreenCubitState> {
  HomeScreenCubit({
    required this.saveFcmTokenInteractor,
  }) : super(HomeScreenCubitState());

  final SaveFcmTokenInteractor saveFcmTokenInteractor;

  void init() {
    emit(HomeScreenCubitState(isLoading: true));
    _listenToFCMTokenChanges();

    final currentUser = FirebaseAuth.instance.currentUser;
    getProUserDataDoc(currentUser?.uid ?? '').get().then((result) {
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

  var _listeningToFCMTokens = false;

  void _listenToFCMTokenChanges() {
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
}

@freezed
class HomeScreenCubitState with _$HomeScreenCubitState {
  const HomeScreenCubitState._();

  factory HomeScreenCubitState({
    @Default(false) bool isLoading,
    @Default(false) bool hasError,
    bool? userShouldGrantNotificationPermission,
    ProfessionalUser? user,
  }) = _HomeScreenCubitState;
}
