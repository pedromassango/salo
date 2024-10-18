import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' hide Category;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:salo/src/auth/domain/firebase_collections.dart';
import 'package:salo/src/professionals/domain/professional_user.dart';

part 'profile_screen_cubit.freezed.dart';

class ProfileScreenCubit extends Cubit<ProfileScreenCubitState> {
  ProfileScreenCubit() : super(ProfileScreenCubitState());

  void init() {
    emit(ProfileScreenCubitState(
      isLoading: true,
    ));

    final currentUser = FirebaseAuth.instance.currentUser;
    getProUserDataDoc(currentUser?.uid ?? '')
        .get(const GetOptions(source: Source.cache))
        .then((result) {
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
        phoneNumber: currentUser?.phoneNumber ?? '',
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
class ProfileScreenCubitState with _$ProfileScreenCubitState {
  const ProfileScreenCubitState._();

  factory ProfileScreenCubitState({
    @Default(false) bool isLoading,
    @Default(false) bool hasError,
    @Default('') String phoneNumber,
    ProfessionalUser? user,
  }) = _ProfileScreenCubitState;
}
