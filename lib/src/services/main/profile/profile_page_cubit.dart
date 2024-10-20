import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:salo/src/professionals/domain/professional_user.dart';

part 'profile_page_cubit.freezed.dart';

class ProfilePageCubit extends Cubit<ProfilePageCubitState> {
  ProfilePageCubit() : super(ProfilePageCubitState());

  void init() {
    emit(ProfilePageCubitState(isLoading: true));

    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      loadUserData(currentUser);
    }
  }

  void loadUserData(User user) {}
}

@freezed
class ProfilePageCubitState with _$ProfilePageCubitState {
  const ProfilePageCubitState._();

  factory ProfilePageCubitState({
    @Default(false) bool isLoading,
    @Default(false) bool hasError,
    ProfessionalUser? user,
  }) = _ProfilePageCubitState;
}
