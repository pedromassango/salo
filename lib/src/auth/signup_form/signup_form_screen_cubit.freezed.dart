// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup_form_screen_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SignupFormScreenCubitState {
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  Gender? get gender => throw _privateConstructorUsedError;
  String get province => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  bool get isCreatingAccount => throw _privateConstructorUsedError;
  bool get isAccountCreated => throw _privateConstructorUsedError;
  bool get isLoadingCategories => throw _privateConstructorUsedError;
  List<Category> get categories => throw _privateConstructorUsedError;
  Category? get selectedMainCategory => throw _privateConstructorUsedError;
  List<Category> get selectedSubCategories =>
      throw _privateConstructorUsedError;

  /// Create a copy of SignupFormScreenCubitState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SignupFormScreenCubitStateCopyWith<SignupFormScreenCubitState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignupFormScreenCubitStateCopyWith<$Res> {
  factory $SignupFormScreenCubitStateCopyWith(SignupFormScreenCubitState value,
          $Res Function(SignupFormScreenCubitState) then) =
      _$SignupFormScreenCubitStateCopyWithImpl<$Res,
          SignupFormScreenCubitState>;
  @useResult
  $Res call(
      {String firstName,
      String lastName,
      Gender? gender,
      String province,
      String city,
      bool isCreatingAccount,
      bool isAccountCreated,
      bool isLoadingCategories,
      List<Category> categories,
      Category? selectedMainCategory,
      List<Category> selectedSubCategories});

  $CategoryCopyWith<$Res>? get selectedMainCategory;
}

/// @nodoc
class _$SignupFormScreenCubitStateCopyWithImpl<$Res,
        $Val extends SignupFormScreenCubitState>
    implements $SignupFormScreenCubitStateCopyWith<$Res> {
  _$SignupFormScreenCubitStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SignupFormScreenCubitState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? gender = freezed,
    Object? province = null,
    Object? city = null,
    Object? isCreatingAccount = null,
    Object? isAccountCreated = null,
    Object? isLoadingCategories = null,
    Object? categories = null,
    Object? selectedMainCategory = freezed,
    Object? selectedSubCategories = null,
  }) {
    return _then(_value.copyWith(
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender?,
      province: null == province
          ? _value.province
          : province // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      isCreatingAccount: null == isCreatingAccount
          ? _value.isCreatingAccount
          : isCreatingAccount // ignore: cast_nullable_to_non_nullable
              as bool,
      isAccountCreated: null == isAccountCreated
          ? _value.isAccountCreated
          : isAccountCreated // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingCategories: null == isLoadingCategories
          ? _value.isLoadingCategories
          : isLoadingCategories // ignore: cast_nullable_to_non_nullable
              as bool,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      selectedMainCategory: freezed == selectedMainCategory
          ? _value.selectedMainCategory
          : selectedMainCategory // ignore: cast_nullable_to_non_nullable
              as Category?,
      selectedSubCategories: null == selectedSubCategories
          ? _value.selectedSubCategories
          : selectedSubCategories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
    ) as $Val);
  }

  /// Create a copy of SignupFormScreenCubitState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryCopyWith<$Res>? get selectedMainCategory {
    if (_value.selectedMainCategory == null) {
      return null;
    }

    return $CategoryCopyWith<$Res>(_value.selectedMainCategory!, (value) {
      return _then(_value.copyWith(selectedMainCategory: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SignupFormScreenCubitStateImplCopyWith<$Res>
    implements $SignupFormScreenCubitStateCopyWith<$Res> {
  factory _$$SignupFormScreenCubitStateImplCopyWith(
          _$SignupFormScreenCubitStateImpl value,
          $Res Function(_$SignupFormScreenCubitStateImpl) then) =
      __$$SignupFormScreenCubitStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String firstName,
      String lastName,
      Gender? gender,
      String province,
      String city,
      bool isCreatingAccount,
      bool isAccountCreated,
      bool isLoadingCategories,
      List<Category> categories,
      Category? selectedMainCategory,
      List<Category> selectedSubCategories});

  @override
  $CategoryCopyWith<$Res>? get selectedMainCategory;
}

/// @nodoc
class __$$SignupFormScreenCubitStateImplCopyWithImpl<$Res>
    extends _$SignupFormScreenCubitStateCopyWithImpl<$Res,
        _$SignupFormScreenCubitStateImpl>
    implements _$$SignupFormScreenCubitStateImplCopyWith<$Res> {
  __$$SignupFormScreenCubitStateImplCopyWithImpl(
      _$SignupFormScreenCubitStateImpl _value,
      $Res Function(_$SignupFormScreenCubitStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignupFormScreenCubitState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? gender = freezed,
    Object? province = null,
    Object? city = null,
    Object? isCreatingAccount = null,
    Object? isAccountCreated = null,
    Object? isLoadingCategories = null,
    Object? categories = null,
    Object? selectedMainCategory = freezed,
    Object? selectedSubCategories = null,
  }) {
    return _then(_$SignupFormScreenCubitStateImpl(
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender?,
      province: null == province
          ? _value.province
          : province // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      isCreatingAccount: null == isCreatingAccount
          ? _value.isCreatingAccount
          : isCreatingAccount // ignore: cast_nullable_to_non_nullable
              as bool,
      isAccountCreated: null == isAccountCreated
          ? _value.isAccountCreated
          : isAccountCreated // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingCategories: null == isLoadingCategories
          ? _value.isLoadingCategories
          : isLoadingCategories // ignore: cast_nullable_to_non_nullable
              as bool,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      selectedMainCategory: freezed == selectedMainCategory
          ? _value.selectedMainCategory
          : selectedMainCategory // ignore: cast_nullable_to_non_nullable
              as Category?,
      selectedSubCategories: null == selectedSubCategories
          ? _value._selectedSubCategories
          : selectedSubCategories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
    ));
  }
}

/// @nodoc

class _$SignupFormScreenCubitStateImpl extends _SignupFormScreenCubitState {
  _$SignupFormScreenCubitStateImpl(
      {this.firstName = '',
      this.lastName = '',
      this.gender,
      this.province = '',
      this.city = '',
      this.isCreatingAccount = false,
      this.isAccountCreated = false,
      this.isLoadingCategories = false,
      final List<Category> categories = const <Category>[],
      this.selectedMainCategory,
      final List<Category> selectedSubCategories = const <Category>[]})
      : _categories = categories,
        _selectedSubCategories = selectedSubCategories,
        super._();

  @override
  @JsonKey()
  final String firstName;
  @override
  @JsonKey()
  final String lastName;
  @override
  final Gender? gender;
  @override
  @JsonKey()
  final String province;
  @override
  @JsonKey()
  final String city;
  @override
  @JsonKey()
  final bool isCreatingAccount;
  @override
  @JsonKey()
  final bool isAccountCreated;
  @override
  @JsonKey()
  final bool isLoadingCategories;
  final List<Category> _categories;
  @override
  @JsonKey()
  List<Category> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  final Category? selectedMainCategory;
  final List<Category> _selectedSubCategories;
  @override
  @JsonKey()
  List<Category> get selectedSubCategories {
    if (_selectedSubCategories is EqualUnmodifiableListView)
      return _selectedSubCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedSubCategories);
  }

  @override
  String toString() {
    return 'SignupFormScreenCubitState(firstName: $firstName, lastName: $lastName, gender: $gender, province: $province, city: $city, isCreatingAccount: $isCreatingAccount, isAccountCreated: $isAccountCreated, isLoadingCategories: $isLoadingCategories, categories: $categories, selectedMainCategory: $selectedMainCategory, selectedSubCategories: $selectedSubCategories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignupFormScreenCubitStateImpl &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.province, province) ||
                other.province == province) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.isCreatingAccount, isCreatingAccount) ||
                other.isCreatingAccount == isCreatingAccount) &&
            (identical(other.isAccountCreated, isAccountCreated) ||
                other.isAccountCreated == isAccountCreated) &&
            (identical(other.isLoadingCategories, isLoadingCategories) ||
                other.isLoadingCategories == isLoadingCategories) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            (identical(other.selectedMainCategory, selectedMainCategory) ||
                other.selectedMainCategory == selectedMainCategory) &&
            const DeepCollectionEquality()
                .equals(other._selectedSubCategories, _selectedSubCategories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      firstName,
      lastName,
      gender,
      province,
      city,
      isCreatingAccount,
      isAccountCreated,
      isLoadingCategories,
      const DeepCollectionEquality().hash(_categories),
      selectedMainCategory,
      const DeepCollectionEquality().hash(_selectedSubCategories));

  /// Create a copy of SignupFormScreenCubitState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignupFormScreenCubitStateImplCopyWith<_$SignupFormScreenCubitStateImpl>
      get copyWith => __$$SignupFormScreenCubitStateImplCopyWithImpl<
          _$SignupFormScreenCubitStateImpl>(this, _$identity);
}

abstract class _SignupFormScreenCubitState extends SignupFormScreenCubitState {
  factory _SignupFormScreenCubitState(
          {final String firstName,
          final String lastName,
          final Gender? gender,
          final String province,
          final String city,
          final bool isCreatingAccount,
          final bool isAccountCreated,
          final bool isLoadingCategories,
          final List<Category> categories,
          final Category? selectedMainCategory,
          final List<Category> selectedSubCategories}) =
      _$SignupFormScreenCubitStateImpl;
  _SignupFormScreenCubitState._() : super._();

  @override
  String get firstName;
  @override
  String get lastName;
  @override
  Gender? get gender;
  @override
  String get province;
  @override
  String get city;
  @override
  bool get isCreatingAccount;
  @override
  bool get isAccountCreated;
  @override
  bool get isLoadingCategories;
  @override
  List<Category> get categories;
  @override
  Category? get selectedMainCategory;
  @override
  List<Category> get selectedSubCategories;

  /// Create a copy of SignupFormScreenCubitState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignupFormScreenCubitStateImplCopyWith<_$SignupFormScreenCubitStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
