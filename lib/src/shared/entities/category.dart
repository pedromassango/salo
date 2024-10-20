import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart' as uuid;

part 'category.freezed.dart';
part 'category.g.dart';

const uuidInstance = uuid.Uuid();

@freezed
class Category with _$Category {
  const Category._();

  factory Category({
    required String id,
    @Default(100) int priority,
    required String title,
    required String? imageUrl,
    required String? message,
    @Default(<Category>[]) List<Category> subcategories,
  }) = _Category;

  // Auto assign an id in case we're parsing categories from the json file,
  // as they don't have an id.
  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson({
        'id': json['id'] ?? uuidInstance.v4(),
        ...json,
      });

  String getTitle(List<Category> others) {
    return '$title > ${others.map((i) => i.title).join(', ')}';
  }

  List<Category> get subcategoriesByPriority =>
      subcategories.sorted((a, b) => a.priority.compareTo(b.priority));
}
