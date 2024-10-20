// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryImpl _$$CategoryImplFromJson(Map<String, dynamic> json) =>
    _$CategoryImpl(
      id: json['id'] as String,
      priority: (json['priority'] as num?)?.toInt() ?? 100,
      title: json['title'] as String,
      imageUrl: json['imageUrl'] as String?,
      message: json['message'] as String?,
      subcategories: (json['subcategories'] as List<dynamic>?)
              ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Category>[],
    );

Map<String, dynamic> _$$CategoryImplToJson(_$CategoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'priority': instance.priority,
      'title': instance.title,
      'imageUrl': instance.imageUrl,
      'message': instance.message,
      'subcategories': instance.subcategories,
    };
