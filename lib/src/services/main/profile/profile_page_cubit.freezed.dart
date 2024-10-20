// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_page_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProfilePageCubitState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;
  ProfessionalUser? get user => throw _privateConstructorUsedError;

  /// Create a copy of ProfilePageCubitState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfilePageCubitStateCopyWith<ProfilePageCubitState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfilePageCubitStateCopyWith<$Res> {
  factory $ProfilePageCubitStateCopyWith(ProfilePageCubitState value,
          $Res Function(ProfilePageCubitState) then) =
      _$ProfilePageCubitStateCopyWithImpl<$Res, ProfilePageCubitState>;
  @useResult
  $Res call({bool isLoading, bool hasError, ProfessionalUser? user});

  $ProfessionalUserCopyWith<$Res>? get user;
}

/// @nodoc
class _$ProfilePageCubitStateCopyWithImpl<$Res,
        $Val extends ProfilePageCubitState>
    implements $ProfilePageCubitStateCopyWith<$Res> {
  _$ProfilePageCubitStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfilePageCubitState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? hasError = null,
    Object? user = freezed,
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
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as ProfessionalUser?,
    ) as $Val);
  }

  /// Create a copy of ProfilePageCubitState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfessionalUserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $ProfessionalUserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProfilePageCubitStateImplCopyWith<$Res>
    implements $ProfilePageCubitStateCopyWith<$Res> {
  factory _$$ProfilePageCubitStateImplCopyWith(
          _$ProfilePageCubitStateImpl value,
          $Res Function(_$ProfilePageCubitStateImpl) then) =
      __$$ProfilePageCubitStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, bool hasError, ProfessionalUser? user});

  @override
  $ProfessionalUserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$ProfilePageCubitStateImplCopyWithImpl<$Res>
    extends _$ProfilePageCubitStateCopyWithImpl<$Res,
        _$ProfilePageCubitStateImpl>
    implements _$$ProfilePageCubitStateImplCopyWith<$Res> {
  __$$ProfilePageCubitStateImplCopyWithImpl(_$ProfilePageCubitStateImpl _value,
      $Res Function(_$ProfilePageCubitStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfilePageCubitState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? hasError = null,
    Object? user = freezed,
  }) {
    return _then(_$ProfilePageCubitStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as ProfessionalUser?,
    ));
  }
}

/// @nodoc

class _$ProfilePageCubitStateImpl extends _ProfilePageCubitState {
  _$ProfilePageCubitStateImpl(
      {this.isLoading = false, this.hasError = false, this.user})
      : super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool hasError;
  @override
  final ProfessionalUser? user;

  @override
  String toString() {
    return 'ProfilePageCubitState(isLoading: $isLoading, hasError: $hasError, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfilePageCubitStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.hasError, hasError) ||
                other.hasError == hasError) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, hasError, user);

  /// Create a copy of ProfilePageCubitState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfilePageCubitStateImplCopyWith<_$ProfilePageCubitStateImpl>
      get copyWith => __$$ProfilePageCubitStateImplCopyWithImpl<
          _$ProfilePageCubitStateImpl>(this, _$identity);
}

abstract class _ProfilePageCubitState extends ProfilePageCubitState {
  factory _ProfilePageCubitState(
      {final bool isLoading,
      final bool hasError,
      final ProfessionalUser? user}) = _$ProfilePageCubitStateImpl;
  _ProfilePageCubitState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get hasError;
  @override
  ProfessionalUser? get user;

  /// Create a copy of ProfilePageCubitState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfilePageCubitStateImplCopyWith<_$ProfilePageCubitStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
