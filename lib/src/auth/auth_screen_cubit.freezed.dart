// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_screen_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthScreenCubitState {
  String get phoneNumber => throw _privateConstructorUsedError;
  String get otpCode =>
      throw _privateConstructorUsedError; // TODO: add support to more country codes.
  String get countryCode => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isOtpCodeSent => throw _privateConstructorUsedError;
  AuthVerificationState get authState => throw _privateConstructorUsedError;

  /// Create a copy of AuthScreenCubitState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthScreenCubitStateCopyWith<AuthScreenCubitState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthScreenCubitStateCopyWith<$Res> {
  factory $AuthScreenCubitStateCopyWith(AuthScreenCubitState value,
          $Res Function(AuthScreenCubitState) then) =
      _$AuthScreenCubitStateCopyWithImpl<$Res, AuthScreenCubitState>;
  @useResult
  $Res call(
      {String phoneNumber,
      String otpCode,
      String countryCode,
      bool isLoading,
      bool isOtpCodeSent,
      AuthVerificationState authState});
}

/// @nodoc
class _$AuthScreenCubitStateCopyWithImpl<$Res,
        $Val extends AuthScreenCubitState>
    implements $AuthScreenCubitStateCopyWith<$Res> {
  _$AuthScreenCubitStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthScreenCubitState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
    Object? otpCode = null,
    Object? countryCode = null,
    Object? isLoading = null,
    Object? isOtpCodeSent = null,
    Object? authState = null,
  }) {
    return _then(_value.copyWith(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      otpCode: null == otpCode
          ? _value.otpCode
          : otpCode // ignore: cast_nullable_to_non_nullable
              as String,
      countryCode: null == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isOtpCodeSent: null == isOtpCodeSent
          ? _value.isOtpCodeSent
          : isOtpCodeSent // ignore: cast_nullable_to_non_nullable
              as bool,
      authState: null == authState
          ? _value.authState
          : authState // ignore: cast_nullable_to_non_nullable
              as AuthVerificationState,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthScreenCubitStateImplCopyWith<$Res>
    implements $AuthScreenCubitStateCopyWith<$Res> {
  factory _$$AuthScreenCubitStateImplCopyWith(_$AuthScreenCubitStateImpl value,
          $Res Function(_$AuthScreenCubitStateImpl) then) =
      __$$AuthScreenCubitStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String phoneNumber,
      String otpCode,
      String countryCode,
      bool isLoading,
      bool isOtpCodeSent,
      AuthVerificationState authState});
}

/// @nodoc
class __$$AuthScreenCubitStateImplCopyWithImpl<$Res>
    extends _$AuthScreenCubitStateCopyWithImpl<$Res, _$AuthScreenCubitStateImpl>
    implements _$$AuthScreenCubitStateImplCopyWith<$Res> {
  __$$AuthScreenCubitStateImplCopyWithImpl(_$AuthScreenCubitStateImpl _value,
      $Res Function(_$AuthScreenCubitStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthScreenCubitState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
    Object? otpCode = null,
    Object? countryCode = null,
    Object? isLoading = null,
    Object? isOtpCodeSent = null,
    Object? authState = null,
  }) {
    return _then(_$AuthScreenCubitStateImpl(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      otpCode: null == otpCode
          ? _value.otpCode
          : otpCode // ignore: cast_nullable_to_non_nullable
              as String,
      countryCode: null == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isOtpCodeSent: null == isOtpCodeSent
          ? _value.isOtpCodeSent
          : isOtpCodeSent // ignore: cast_nullable_to_non_nullable
              as bool,
      authState: null == authState
          ? _value.authState
          : authState // ignore: cast_nullable_to_non_nullable
              as AuthVerificationState,
    ));
  }
}

/// @nodoc

class _$AuthScreenCubitStateImpl extends _AuthScreenCubitState {
  _$AuthScreenCubitStateImpl(
      {this.phoneNumber = '',
      this.otpCode = '',
      this.countryCode = '+244',
      this.isLoading = false,
      this.isOtpCodeSent = false,
      this.authState = AuthVerificationState.none})
      : super._();

  @override
  @JsonKey()
  final String phoneNumber;
  @override
  @JsonKey()
  final String otpCode;
// TODO: add support to more country codes.
  @override
  @JsonKey()
  final String countryCode;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isOtpCodeSent;
  @override
  @JsonKey()
  final AuthVerificationState authState;

  @override
  String toString() {
    return 'AuthScreenCubitState(phoneNumber: $phoneNumber, otpCode: $otpCode, countryCode: $countryCode, isLoading: $isLoading, isOtpCodeSent: $isOtpCodeSent, authState: $authState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthScreenCubitStateImpl &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.otpCode, otpCode) || other.otpCode == otpCode) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isOtpCodeSent, isOtpCodeSent) ||
                other.isOtpCodeSent == isOtpCodeSent) &&
            (identical(other.authState, authState) ||
                other.authState == authState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, phoneNumber, otpCode,
      countryCode, isLoading, isOtpCodeSent, authState);

  /// Create a copy of AuthScreenCubitState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthScreenCubitStateImplCopyWith<_$AuthScreenCubitStateImpl>
      get copyWith =>
          __$$AuthScreenCubitStateImplCopyWithImpl<_$AuthScreenCubitStateImpl>(
              this, _$identity);
}

abstract class _AuthScreenCubitState extends AuthScreenCubitState {
  factory _AuthScreenCubitState(
      {final String phoneNumber,
      final String otpCode,
      final String countryCode,
      final bool isLoading,
      final bool isOtpCodeSent,
      final AuthVerificationState authState}) = _$AuthScreenCubitStateImpl;
  _AuthScreenCubitState._() : super._();

  @override
  String get phoneNumber;
  @override
  String get otpCode; // TODO: add support to more country codes.
  @override
  String get countryCode;
  @override
  bool get isLoading;
  @override
  bool get isOtpCodeSent;
  @override
  AuthVerificationState get authState;

  /// Create a copy of AuthScreenCubitState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthScreenCubitStateImplCopyWith<_$AuthScreenCubitStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
