import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class GetCategoriesUsecase {
  Future<List<Category>> call() async {
    //final jsonString = await rootBundle.loadString('assets/categories.json');
    //List<Category> categories = parseCategoriesJson(jsonString);

    return FirebaseFirestore.instance
        .collection('categories')
        .get()
        .then((result) {
      return result.docs.map((shot) => Category.fromJson(shot.data())).toList();
    });
  }
}

const uuid = Uuid();

class Category {
  final String id;
  final String title;
  final String? image;
  final String? message;
  final List<Category> subcategories;

  Category({
    required this.id,
    required this.title,
    this.image,
    this.message,
    this.subcategories = const [],
  });

  String getTitle(List<Category> others) {
    return '$title > ${others.map((i) => i.title).join(', ')}';
  }

  factory Category.fromJson(Map<String, dynamic> json) {
    String uniqueId = uuid.v4();

    return Category(
      id: json['id'] ?? uniqueId,
      title: json['title'],
      image: json['image'],
      message: json['message'],
      subcategories: (json['subcategories'] as List<dynamic>?)
              ?.map((e) => Category.fromJson(e))
              .toList() ??
          [],
    );
  }

  // Converts a Category object to a Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'image': image,
      'message': message,
      'subcategories':
          subcategories.map((subcategory) => subcategory.toMap()).toList(),
    };
  }
}

List<Category> parseCategoriesJson(String jsonString) {
  final List<dynamic> jsonList = json.decode(jsonString);
  return jsonList
      .map((categoryJson) => Category.fromJson(categoryJson))
      .toList();
}
