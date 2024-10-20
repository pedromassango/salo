import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/services.dart';
import 'package:salo/src/shared/entities/category.dart';

class GetCategoriesUsecase {
  Future<List<Category>> call() async {
    return FirebaseFirestore.instance
        .collection('categories')
        .get()
        .then((result) {
      return result.docs.map((shot) => Category.fromJson(shot.data())).sorted(
            (a, b) => a.priority.compareTo(b.priority),
          );
    });
  }
}

class UploadCategoriesUsecase {
  Future<void> call() async {
    final jsonString = await rootBundle.loadString('assets/categories.json');
    final categories = parseCategoriesJson(jsonString);

    final firestore = FirebaseFirestore.instance;
    final collection = firestore.collection('categories');

    // Get all the documents in the collection
    final querySnapshot = await collection.get();

    // Loop through each document and delete it
    for (final doc in querySnapshot.docs) {
      await doc.reference.delete();
    }

    for (final categoryJson in categories) {
      collection.doc().set(categoryJson);
    }
  }
}

List<Map<String, dynamic>> parseCategoriesJson(String jsonString) {
  final List<dynamic> jsonList = json.decode(jsonString);
  return jsonList.map((json) => json as Map<String, dynamic>).toList();
}
