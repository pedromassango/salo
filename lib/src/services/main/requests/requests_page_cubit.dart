import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:salo/src/professionals/domain/professional_user.dart';

part 'requests_page_cubit.freezed.dart';

class RequestsPageCubit extends Cubit<RequestsPageCubitState> {
  RequestsPageCubit() : super(RequestsPageCubitState());

  void init() {
    emit(RequestsPageCubitState(isLoading: true));

    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      loadUserData(currentUser);
    }
  }

  void loadUserData(User user) {}
}

@freezed
class RequestsPageCubitState with _$RequestsPageCubitState {
  const RequestsPageCubitState._();

  factory RequestsPageCubitState({
    @Default(false) bool isLoading,
    @Default(false) bool hasError,
    ProfessionalUser? user,
  }) = _RequestsPageCubitState;
}
