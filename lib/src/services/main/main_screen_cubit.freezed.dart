// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_screen_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MainScreenCubitState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;
  bool? get userShouldGrantNotificationPermission =>
      throw _privateConstructorUsedError;
  ProfessionalUser? get user => throw _privateConstructorUsedError;

  /// Create a copy of MainScreenCubitState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MainScreenCubitStateCopyWith<MainScreenCubitState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainScreenCubitStateCopyWith<$Res> {
  factory $MainScreenCubitStateCopyWith(MainScreenCubitState value,
          $Res Function(MainScreenCubitState) then) =
      _$MainScreenCubitStateCopyWithImpl<$Res, MainScreenCubitState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool hasError,
      bool? userShouldGrantNotificationPermission,
      ProfessionalUser? user});

  $ProfessionalUserCopyWith<$Res>? get user;
}

/// @nodoc
class _$MainScreenCubitStateCopyWithImpl<$Res,
        $Val extends MainScreenCubitState>
    implements $MainScreenCubitStateCopyWith<$Res> {
  _$MainScreenCubitStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MainScreenCubitState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? hasError = null,
    Object? userShouldGrantNotificationPermission = freezed,
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
      userShouldGrantNotificationPermission: freezed ==
              userShouldGrantNotificationPermission
          ? _value.userShouldGrantNotificationPermission
          : userShouldGrantNotificationPermission // ignore: cast_nullable_to_non_nullable
              as bool?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as ProfessionalUser?,
    ) as $Val);
  }

  /// Create a copy of MainScreenCubitState
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
abstract class _$$MainScreenCubitStateImplCopyWith<$Res>
    implements $MainScreenCubitStateCopyWith<$Res> {
  factory _$$MainScreenCubitStateImplCopyWith(_$MainScreenCubitStateImpl value,
          $Res Function(_$MainScreenCubitStateImpl) then) =
      __$$MainScreenCubitStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool hasError,
      bool? userShouldGrantNotificationPermission,
      ProfessionalUser? user});

  @override
  $ProfessionalUserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$MainScreenCubitStateImplCopyWithImpl<$Res>
    extends _$MainScreenCubitStateCopyWithImpl<$Res, _$MainScreenCubitStateImpl>
    implements _$$MainScreenCubitStateImplCopyWith<$Res> {
  __$$MainScreenCubitStateImplCopyWithImpl(_$MainScreenCubitStateImpl _value,
      $Res Function(_$MainScreenCubitStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MainScreenCubitState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? hasError = null,
    Object? userShouldGrantNotificationPermission = freezed,
    Object? user = freezed,
  }) {
    return _then(_$MainScreenCubitStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      userShouldGrantNotificationPermission: freezed ==
              userShouldGrantNotificationPermission
          ? _value.userShouldGrantNotificationPermission
          : userShouldGrantNotificationPermission // ignore: cast_nullable_to_non_nullable
              as bool?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as ProfessionalUser?,
    ));
  }
}

/// @nodoc

class _$MainScreenCubitStateImpl extends _MainScreenCubitState
    with DiagnosticableTreeMixin {
  _$MainScreenCubitStateImpl(
      {this.isLoading = false,
      this.hasError = false,
      this.userShouldGrantNotificationPermission,
      this.user})
      : super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool hasError;
  @override
  final bool? userShouldGrantNotificationPermission;
  @override
  final ProfessionalUser? user;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MainScreenCubitState(isLoading: $isLoading, hasError: $hasError, userShouldGrantNotificationPermission: $userShouldGrantNotificationPermission, user: $user)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MainScreenCubitState'))
      ..add(DiagnosticsProperty('isLoading', isLoading))
      ..add(DiagnosticsProperty('hasError', hasError))
      ..add(DiagnosticsProperty('userShouldGrantNotificationPermission',
          userShouldGrantNotificationPermission))
      ..add(DiagnosticsProperty('user', user));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MainScreenCubitStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.hasError, hasError) ||
                other.hasError == hasError) &&
            (identical(other.userShouldGrantNotificationPermission,
                    userShouldGrantNotificationPermission) ||
                other.userShouldGrantNotificationPermission ==
                    userShouldGrantNotificationPermission) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, hasError,
      userShouldGrantNotificationPermission, user);

  /// Create a copy of MainScreenCubitState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MainScreenCubitStateImplCopyWith<_$MainScreenCubitStateImpl>
      get copyWith =>
          __$$MainScreenCubitStateImplCopyWithImpl<_$MainScreenCubitStateImpl>(
              this, _$identity);
}

abstract class _MainScreenCubitState extends MainScreenCubitState {
  factory _MainScreenCubitState(
      {final bool isLoading,
      final bool hasError,
      final bool? userShouldGrantNotificationPermission,
      final ProfessionalUser? user}) = _$MainScreenCubitStateImpl;
  _MainScreenCubitState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get hasError;
  @override
  bool? get userShouldGrantNotificationPermission;
  @override
  ProfessionalUser? get user;

  /// Create a copy of MainScreenCubitState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MainScreenCubitStateImplCopyWith<_$MainScreenCubitStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
