// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'authentication_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthenticationModel {
  String get uid;
  String get email;
  String get fullName;
  String get password;
  DateTime get createdAt;
  int get streak;
  int get points;

  /// Create a copy of AuthenticationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AuthenticationModelCopyWith<AuthenticationModel> get copyWith =>
      _$AuthenticationModelCopyWithImpl<AuthenticationModel>(
          this as AuthenticationModel, _$identity);

  /// Serializes this AuthenticationModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AuthenticationModel &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.streak, streak) || other.streak == streak) &&
            (identical(other.points, points) || other.points == points));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, uid, email, fullName, password, createdAt, streak, points);

  @override
  String toString() {
    return 'AuthenticationModel(uid: $uid, email: $email, fullName: $fullName, password: $password, createdAt: $createdAt, streak: $streak, points: $points)';
  }
}

/// @nodoc
abstract mixin class $AuthenticationModelCopyWith<$Res> {
  factory $AuthenticationModelCopyWith(
          AuthenticationModel value, $Res Function(AuthenticationModel) _then) =
      _$AuthenticationModelCopyWithImpl;
  @useResult
  $Res call(
      {String uid,
      String email,
      String fullName,
      String password,
      DateTime createdAt,
      int streak,
      int points});
}

/// @nodoc
class _$AuthenticationModelCopyWithImpl<$Res>
    implements $AuthenticationModelCopyWith<$Res> {
  _$AuthenticationModelCopyWithImpl(this._self, this._then);

  final AuthenticationModel _self;
  final $Res Function(AuthenticationModel) _then;

  /// Create a copy of AuthenticationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? email = null,
    Object? fullName = null,
    Object? password = null,
    Object? createdAt = null,
    Object? streak = null,
    Object? points = null,
  }) {
    return _then(_self.copyWith(
      uid: null == uid
          ? _self.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _self.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      streak: null == streak
          ? _self.streak
          : streak // ignore: cast_nullable_to_non_nullable
              as int,
      points: null == points
          ? _self.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@jsonSerializable
class _AuthenticationModel extends AuthenticationModel {
  const _AuthenticationModel(
      {required this.uid,
      required this.email,
      required this.fullName,
      required this.password,
      required this.createdAt,
      required this.streak,
      required this.points})
      : super._();
  factory _AuthenticationModel.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationModelFromJson(json);

  @override
  final String uid;
  @override
  final String email;
  @override
  final String fullName;
  @override
  final String password;
  @override
  final DateTime createdAt;
  @override
  final int streak;
  @override
  final int points;

  /// Create a copy of AuthenticationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AuthenticationModelCopyWith<_AuthenticationModel> get copyWith =>
      __$AuthenticationModelCopyWithImpl<_AuthenticationModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AuthenticationModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AuthenticationModel &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.streak, streak) || other.streak == streak) &&
            (identical(other.points, points) || other.points == points));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, uid, email, fullName, password, createdAt, streak, points);

  @override
  String toString() {
    return 'AuthenticationModel(uid: $uid, email: $email, fullName: $fullName, password: $password, createdAt: $createdAt, streak: $streak, points: $points)';
  }
}

/// @nodoc
abstract mixin class _$AuthenticationModelCopyWith<$Res>
    implements $AuthenticationModelCopyWith<$Res> {
  factory _$AuthenticationModelCopyWith(_AuthenticationModel value,
          $Res Function(_AuthenticationModel) _then) =
      __$AuthenticationModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String uid,
      String email,
      String fullName,
      String password,
      DateTime createdAt,
      int streak,
      int points});
}

/// @nodoc
class __$AuthenticationModelCopyWithImpl<$Res>
    implements _$AuthenticationModelCopyWith<$Res> {
  __$AuthenticationModelCopyWithImpl(this._self, this._then);

  final _AuthenticationModel _self;
  final $Res Function(_AuthenticationModel) _then;

  /// Create a copy of AuthenticationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? uid = null,
    Object? email = null,
    Object? fullName = null,
    Object? password = null,
    Object? createdAt = null,
    Object? streak = null,
    Object? points = null,
  }) {
    return _then(_AuthenticationModel(
      uid: null == uid
          ? _self.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _self.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      streak: null == streak
          ? _self.streak
          : streak // ignore: cast_nullable_to_non_nullable
              as int,
      points: null == points
          ? _self.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
