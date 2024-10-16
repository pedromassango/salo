import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:salo/src/auth/domain/firebase_auth_extension.dart';

enum AuthVerificationState {
  none,
  error,
  errorInvalidOtp,
  accountIncomplete,
  loggedIn
}

class SendOtpUsecase {
  final _firebaseAuth = FirebaseAuth.instance;
  int? _forceResendingToken;
  String? _verificationId;

  Future requestOtpCode({
    required String phoneNumber,
    required VoidCallback onCodeSent,
    required ValueChanged<AuthVerificationState> onVerificationCompleted,
    required VoidCallback onError,
  }) async {
    await _firebaseAuth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      forceResendingToken: _forceResendingToken,
      codeSent: (verificationId, forceResendingToken) {
        debugPrint('codeSent');
        _forceResendingToken = forceResendingToken;
        _verificationId = verificationId;
        onCodeSent.call();
      },
      codeAutoRetrievalTimeout: (verificationId) {
        debugPrint('codeAutoRetrievalTimeout');
      },
      verificationFailed: (exception) {
        debugPrint('verificationFailed');
        debugPrint('Phone verification failed: $exception');
        if (exception.code == 'invalid-phone-number') {
          debugPrint('The provided phone number is not valid.');
        }
        onError.call();
      },
      verificationCompleted: (phoneCredentials) async {
        debugPrint('verificationCompleted');
        final credentials =
            await _firebaseAuth.signInWithCredential(phoneCredentials);
        final authState = await _verifyAccountCompletion(credentials);
        onVerificationCompleted(authState);
      },
    );
  }

  Future<AuthVerificationState> verifyOtp(String smsCode) async {
    final verificationId = _verificationId;
    if (verificationId == null) {
      return AuthVerificationState.error;
    }

    try {
      // Create a PhoneAuthCredential with the code
      final credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );

      // Sign the user in (or link) with the credential
      final credentials = await _firebaseAuth.signInWithCredential(credential);
      return _verifyAccountCompletion(credentials);
    } on FirebaseAuthException catch (e) {
      debugPrint('VeryOtp error: $e');
      if (e.code == 'invalid-verification-code') {
        return AuthVerificationState.errorInvalidOtp;
      }
      return AuthVerificationState.error;
    }
  }

  Future<AuthVerificationState> _verifyAccountCompletion(
    UserCredential credentials,
  ) async {
    final isNewUser = credentials.additionalUserInfo?.isNewUser ?? false;
    if (isNewUser) {
      return AuthVerificationState.accountIncomplete;
    }
    try {
      final isSignUpComplete =
          await _firebaseAuth.currentUser!.isSignUpComplete;
      return (isSignUpComplete)
          ? AuthVerificationState.loggedIn
          : AuthVerificationState.accountIncomplete;
    } catch (error) {
      debugPrint(error.toString());
      return AuthVerificationState.error;
    }
  }
}
