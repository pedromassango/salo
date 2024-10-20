// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_page_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomePageCubitState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;
  List<Category> get categories => throw _privateConstructorUsedError;

  /// Create a copy of HomePageCubitState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomePageCubitStateCopyWith<HomePageCubitState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomePageCubitStateCopyWith<$Res> {
  factory $HomePageCubitStateCopyWith(
          HomePageCubitState value, $Res Function(HomePageCubitState) then) =
      _$HomePageCubitStateCopyWithImpl<$Res, HomePageCubitState>;
  @useResult
  $Res call({bool isLoading, bool hasError, List<Category> categories});
}

/// @nodoc
class _$HomePageCubitStateCopyWithImpl<$Res, $Val extends HomePageCubitState>
    implements $HomePageCubitStateCopyWith<$Res> {
  _$HomePageCubitStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomePageCubitState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? hasError = null,
    Object? categories = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomePageCubitStateImplCopyWith<$Res>
    implements $HomePageCubitStateCopyWith<$Res> {
  factory _$$HomePageCubitStateImplCopyWith(_$HomePageCubitStateImpl value,
          $Res Function(_$HomePageCubitStateImpl) then) =
      __$$HomePageCubitStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, bool hasError, List<Category> categories});
}

/// @nodoc
class __$$HomePageCubitStateImplCopyWithImpl<$Res>
    extends _$HomePageCubitStateCopyWithImpl<$Res, _$HomePageCubitStateImpl>
    implements _$$HomePageCubitStateImplCopyWith<$Res> {
  __$$HomePageCubitStateImplCopyWithImpl(_$HomePageCubitStateImpl _value,
      $Res Function(_$HomePageCubitStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomePageCubitState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? hasError = null,
    Object? categories = null,
  }) {
    return _then(_$HomePageCubitStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
    ));
  }
}

/// @nodoc

class _$HomePageCubitStateImpl extends _HomePageCubitState {
  _$HomePageCubitStateImpl(
      {this.isLoading = false,
      this.hasError = false,
      final List<Category> categories = const []})
      : _categories = categories,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool hasError;
  final List<Category> _categories;
  @override
  @JsonKey()
  List<Category> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  String toString() {
    return 'HomePageCubitState(isLoading: $isLoading, hasError: $hasError, categories: $categories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomePageCubitStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.hasError, hasError) ||
                other.hasError == hasError) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, hasError,
      const DeepCollectionEquality().hash(_categories));

  /// Create a copy of HomePageCubitState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomePageCubitStateImplCopyWith<_$HomePageCubitStateImpl> get copyWith =>
      __$$HomePageCubitStateImplCopyWithImpl<_$HomePageCubitStateImpl>(
          this, _$identity);
}

abstract class _HomePageCubitState extends HomePageCubitState {
  factory _HomePageCubitState(
      {final bool isLoading,
      final bool hasError,
      final List<Category> categories}) = _$HomePageCubitStateImpl;
  _HomePageCubitState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get hasError;
  @override
  List<Category> get categories;

  /// Create a copy of HomePageCubitState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomePageCubitStateImplCopyWith<_$HomePageCubitStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
