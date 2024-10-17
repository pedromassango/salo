import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

extension FirebaseAuthExt on User {
  Future<bool> get isSignUpComplete =>
      getIdTokenResult().then<bool>((tokenResult) {
        // If user already have a valid role on the current app (pro or salo)
        // that means he already filled the account creation form,
        // send them to the home screen.
        final role = tokenResult.claims?['role'];
        return role == appFlavor;
      });
}
