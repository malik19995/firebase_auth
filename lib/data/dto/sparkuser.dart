// This file is "main.dart"
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'sparkuser.freezed.dart';
part 'sparkuser.g.dart';

@freezed
class SparkUser with _$SparkUser {
  const factory SparkUser({
    required String name,
    required int yearOfBirth,
    required String gender,
    required String email,
    required String uid,
  }) = _SparkUser;

  factory SparkUser.fromJson(Map<String, Object?> json) =>
      _$SparkUserFromJson(json);
}
