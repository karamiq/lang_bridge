// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthenticationModel _$AuthenticationModelFromJson(Map<String, dynamic> json) =>
    _AuthenticationModel(
      uid: json['uid'] as String,
      email: json['email'] as String,
      fullName: json['fullName'] as String,
      password: json['password'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      streak: (json['streak'] as num).toInt(),
      points: (json['points'] as num).toInt(),
    );

Map<String, dynamic> _$AuthenticationModelToJson(
        _AuthenticationModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'fullName': instance.fullName,
      'password': instance.password,
      'createdAt': instance.createdAt.toIso8601String(),
      'streak': instance.streak,
      'points': instance.points,
    };
