import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' hide Category;
import 'package:flutter/services.dart';
import 'package:salo/src/shared/entities/category.dart';

import '../../shared/entities/gender.dart';

class SignupUsecase {
  Future<bool> call({
    required String firstName,
    required String lastName,
    required String province,
    required String city,
    required Gender gender,
    required Category selectedMainCategory,
    required List<Category> selectedSubCategories,
  }) async {
    try {
      final auth = FirebaseAuth.instance.currentUser;
      debugPrint('Auth state: ${auth?.uid}');
      final subcategoryIds = selectedSubCategories.map((i) => i.id).toList();

      final payload = {
        'uid': auth?.uid,
        'appFlavor': appFlavor,
        'city': city,
        'lastName': lastName,
        'province': province,
        'gender': gender.name,
        'firstName': firstName,
        'categoryId': selectedMainCategory.id,
        'subcategoryIds': subcategoryIds,
      };
      debugPrint('Success: $payload}');
      final result = await FirebaseFunctions.instance
          .httpsCallable('proCompleteAccountCreation')
          .call(payload);
      debugPrint('Success-server: ${result.data}');
      return true;
    } catch (error) {
      debugPrint('Signup error: $error');
      return false;
    }
  }
}
