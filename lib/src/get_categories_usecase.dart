import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:uuid/uuid.dart';

class GetCategoriesUsecase {
  Future<List<Category>> call() async {
    final String jsonString =
        await rootBundle.loadString('assets/categories.json');
    List<Category> categories = parseCategoriesJson(jsonString);
    return categories;
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

  factory Category.fromJson(Map<String, dynamic> json) {
    String uniqueId = uuid.v4();

    return Category(
      id: uniqueId,
      title: json['title'],
      image: json['image'],
      message: json['message'],
      subcategories: (json['subcategories'] as List<dynamic>?)
              ?.map((e) => Category.fromJson(e))
              .toList() ??
          [],
    );
  }
}

List<Category> parseCategoriesJson(String jsonString) {
  final List<dynamic> jsonList = json.decode(jsonString);
  return jsonList
      .map((categoryJson) => Category.fromJson(categoryJson))
      .toList();
}
