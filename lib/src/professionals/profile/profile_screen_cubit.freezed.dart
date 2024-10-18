// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_screen_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProfileScreenCubitState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  ProfessionalUser? get user => throw _privateConstructorUsedError;

  /// Create a copy of ProfileScreenCubitState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfileScreenCubitStateCopyWith<ProfileScreenCubitState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileScreenCubitStateCopyWith<$Res> {
  factory $ProfileScreenCubitStateCopyWith(ProfileScreenCubitState value,
          $Res Function(ProfileScreenCubitState) then) =
      _$ProfileScreenCubitStateCopyWithImpl<$Res, ProfileScreenCubitState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool hasError,
      String phoneNumber,
      ProfessionalUser? user});

  $ProfessionalUserCopyWith<$Res>? get user;
}

/// @nodoc
class _$ProfileScreenCubitStateCopyWithImpl<$Res,
        $Val extends ProfileScreenCubitState>
    implements $ProfileScreenCubitStateCopyWith<$Res> {
  _$ProfileScreenCubitStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileScreenCubitState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? hasError = null,
    Object? phoneNumber = null,
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
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as ProfessionalUser?,
    ) as $Val);
  }

  /// Create a copy of ProfileScreenCubitState
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
abstract class _$$ProfileScreenCubitStateImplCopyWith<$Res>
    implements $ProfileScreenCubitStateCopyWith<$Res> {
  factory _$$ProfileScreenCubitStateImplCopyWith(
          _$ProfileScreenCubitStateImpl value,
          $Res Function(_$ProfileScreenCubitStateImpl) then) =
      __$$ProfileScreenCubitStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool hasError,
      String phoneNumber,
      ProfessionalUser? user});

  @override
  $ProfessionalUserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$ProfileScreenCubitStateImplCopyWithImpl<$Res>
    extends _$ProfileScreenCubitStateCopyWithImpl<$Res,
        _$ProfileScreenCubitStateImpl>
    implements _$$ProfileScreenCubitStateImplCopyWith<$Res> {
  __$$ProfileScreenCubitStateImplCopyWithImpl(
      _$ProfileScreenCubitStateImpl _value,
      $Res Function(_$ProfileScreenCubitStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileScreenCubitState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? hasError = null,
    Object? phoneNumber = null,
    Object? user = freezed,
  }) {
    return _then(_$ProfileScreenCubitStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as ProfessionalUser?,
    ));
  }
}

/// @nodoc

class _$ProfileScreenCubitStateImpl extends _ProfileScreenCubitState
    with DiagnosticableTreeMixin {
  _$ProfileScreenCubitStateImpl(
      {this.isLoading = false,
      this.hasError = false,
      this.phoneNumber = '',
      this.user})
      : super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool hasError;
  @override
  @JsonKey()
  final String phoneNumber;
  @override
  final ProfessionalUser? user;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProfileScreenCubitState(isLoading: $isLoading, hasError: $hasError, phoneNumber: $phoneNumber, user: $user)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProfileScreenCubitState'))
      ..add(DiagnosticsProperty('isLoading', isLoading))
      ..add(DiagnosticsProperty('hasError', hasError))
      ..add(DiagnosticsProperty('phoneNumber', phoneNumber))
      ..add(DiagnosticsProperty('user', user));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileScreenCubitStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.hasError, hasError) ||
                other.hasError == hasError) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isLoading, hasError, phoneNumber, user);

  /// Create a copy of ProfileScreenCubitState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileScreenCubitStateImplCopyWith<_$ProfileScreenCubitStateImpl>
      get copyWith => __$$ProfileScreenCubitStateImplCopyWithImpl<
          _$ProfileScreenCubitStateImpl>(this, _$identity);
}

abstract class _ProfileScreenCubitState extends ProfileScreenCubitState {
  factory _ProfileScreenCubitState(
      {final bool isLoading,
      final bool hasError,
      final String phoneNumber,
      final ProfessionalUser? user}) = _$ProfileScreenCubitStateImpl;
  _ProfileScreenCubitState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get hasError;
  @override
  String get phoneNumber;
  @override
  ProfessionalUser? get user;

  /// Create a copy of ProfileScreenCubitState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileScreenCubitStateImplCopyWith<_$ProfileScreenCubitStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
