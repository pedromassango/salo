import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';

import 'firebase_collections.dart';

class SaveFcmTokenInteractor {
  Future<void> call({String? token}) async {
    try {
      var effectiveToken = token;

      if (effectiveToken == null) {
        FirebaseMessaging messaging = FirebaseMessaging.instance;
        effectiveToken = await messaging.getToken();
      }

      if (effectiveToken != null && effectiveToken.trim().isNotEmpty) {
        final currentUser = FirebaseAuth.instance.currentUser!;
        final userId = currentUser.uid;
        final userDoc = getProUserDoc(userId);

        // also send local timezone for scheduling notification on BE
        final now = DateTime.now();
        final timezoneOffsetInMilliseconds = now.timeZoneOffset.inMilliseconds;
        await userDoc.set({
          'fcmToken': effectiveToken,
          'timezoneOffsetInMilliseconds': timezoneOffsetInMilliseconds,
        }, SetOptions(merge: true));
      }

      debugPrint('Token saved');
    } catch (e) {
      debugPrint('Token not saved');
    }
  }
}
