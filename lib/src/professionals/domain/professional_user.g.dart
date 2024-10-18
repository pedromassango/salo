// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'professional_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfessionalUserImpl _$$ProfessionalUserImplFromJson(
        Map<String, dynamic> json) =>
    _$ProfessionalUserImpl(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      city: json['city'] as String,
      province: json['province'] as String,
      categoryId: json['categoryId'] as String,
      categoryTitle: json['categoryTitle'] as String? ?? '',
      servicesCount: (json['servicesCount'] as num?)?.toInt() ?? 0,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      subcategoryIds: (json['subcategoryIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      gender: $enumDecode(_$GenderEnumMap, json['gender']),
    );

Map<String, dynamic> _$$ProfessionalUserImplToJson(
        _$ProfessionalUserImpl instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'city': instance.city,
      'province': instance.province,
      'categoryId': instance.categoryId,
      'categoryTitle': instance.categoryTitle,
      'servicesCount': instance.servicesCount,
      'rating': instance.rating,
      'subcategoryIds': instance.subcategoryIds,
      'gender': _$GenderEnumMap[instance.gender]!,
    };

const _$GenderEnumMap = {
  Gender.male: 'male',
  Gender.female: 'female',
};
