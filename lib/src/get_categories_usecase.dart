import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class GetCategoriesUsecase {
  Future<List<Category>> call() async {
    final String jsonString =
        await rootBundle.loadString('assets/categories.json');
    List<Category> categories = parseCategoriesJson(jsonString);
    return categories;
  }
}

class Category {
  final String title;
  final String? image;
  final String? message;
  final List<Category> subcategories;

  Category({
    required this.title,
    this.image,
    this.message,
    this.subcategories = const [],
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      title: json['title'],
      image: json['image'],
      message: json['message'],
      subcategories: (json['subcategories'] as List<dynamic>?)
              ?.map((subcat) => Category.fromJson(subcat))
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
