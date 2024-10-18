import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:salo/src/shared/gender.dart';

part 'professional_user.freezed.dart';
part 'professional_user.g.dart';

@freezed
class ProfessionalUser with _$ProfessionalUser {
  const ProfessionalUser._();

  factory ProfessionalUser({
    required String firstName,
    required String lastName,
    required String city,
    required String province,
    required String categoryId,
    @Default('') String categoryTitle,
    @Default(0) int servicesCount,
    @Default(0.0) double rating,
    required List<String> subcategoryIds,
    required Gender gender,
  }) = _ProfessionalUser;

  factory ProfessionalUser.fromJson(Map<String, dynamic> json) =>
      _$ProfessionalUserFromJson(json);

  String get fullName => '$firstName $lastName';
  String get fullAddress => '$city, $province';
}
