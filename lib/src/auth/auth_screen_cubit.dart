import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:salo/src/auth/domain/send_otp_usecase.dart';

part 'auth_screen_cubit.freezed.dart';

class AuthScreenCubit extends Cubit<AuthScreenCubitState> {
  AuthScreenCubit({
    required this.sendOtpUsecase,
  }) : super(AuthScreenCubitState());

  final SendOtpUsecase sendOtpUsecase;

  void init() {
    emit(AuthScreenCubitState());
  }

  void onPhoneNumberChanged(String number) {
    emit(state.copyWith(
        phoneNumber: number, authState: AuthVerificationState.none));
  }

  void onOtpSubmitted(String otp) {
    emit(state.copyWith(
      otpCode: otp,
      isLoading: false,
      isOtpCodeSent: false,
      authState: AuthVerificationState.none,
    ));

    sendOtpUsecase.verifyOtp(otp).then((authState) {
      emit(state.copyWith(
        otpCode: otp,
        isLoading: false,
        authState: authState,
      ));
    });
  }

  void onSendOtp() {
    if (!state.isPhoneNumberValid) {
      return;
    }

    emit(
        state.copyWith(isLoading: true, authState: AuthVerificationState.none));

    sendOtpUsecase.requestOtpCode(
      phoneNumber: state.effectivePhoneNumber,
      onError: () {
        emit(state.copyWith(
          isLoading: false,
          authState: AuthVerificationState.error,
        ));
      },
      onCodeSent: () {
        emit(state.copyWith(
          isLoading: false,
          isOtpCodeSent: true,
        ));
      },
      onVerificationCompleted: (authState) {
        emit(state.copyWith(
          isLoading: false,
          isOtpCodeSent: false,
          authState: authState,
        ));
      },
    );
  }

  void onSendOtpAgain() {
    onSendOtp();
  }
}

@freezed
class AuthScreenCubitState with _$AuthScreenCubitState {
  const AuthScreenCubitState._();

  factory AuthScreenCubitState({
    @Default('') String phoneNumber,
    @Default('') String otpCode,
    // TODO: add support to more country codes.
    @Default('+244') String countryCode,
    @Default(false) bool isLoading,
    @Default(false) bool isOtpCodeSent,
    @Default(AuthVerificationState.none) AuthVerificationState authState,
  }) = _AuthScreenCubitState;

  final minPhoneNumberLength = 9;

  String get effectivePhoneNumber => countryCode + phoneNumber;

  bool get isPhoneNumberValid =>
      effectivePhoneNumber.trim().length >= minPhoneNumberLength;
}
