// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sparkuser.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SparkUser _$$_SparkUserFromJson(Map<String, dynamic> json) => _$_SparkUser(
      name: json['name'] as String,
      yearOfBirth: json['yearOfBirth'] as int,
      gender: json['gender'] as String,
      email: json['email'] as String,
      uid: json['uid'] as String,
    );

Map<String, dynamic> _$$_SparkUserToJson(_$_SparkUser instance) =>
    <String, dynamic>{
      'name': instance.name,
      'yearOfBirth': instance.yearOfBirth,
      'gender': instance.gender,
      'email': instance.email,
      'uid': instance.uid,
    };
