// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sparkuser.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SparkUser _$SparkUserFromJson(Map<String, dynamic> json) {
  return _SparkUser.fromJson(json);
}

/// @nodoc
mixin _$SparkUser {
  String get name => throw _privateConstructorUsedError;
  int get yearOfBirth => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SparkUserCopyWith<SparkUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SparkUserCopyWith<$Res> {
  factory $SparkUserCopyWith(SparkUser value, $Res Function(SparkUser) then) =
      _$SparkUserCopyWithImpl<$Res, SparkUser>;
  @useResult
  $Res call(
      {String name, int yearOfBirth, String gender, String email, String uid});
}

/// @nodoc
class _$SparkUserCopyWithImpl<$Res, $Val extends SparkUser>
    implements $SparkUserCopyWith<$Res> {
  _$SparkUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? yearOfBirth = null,
    Object? gender = null,
    Object? email = null,
    Object? uid = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      yearOfBirth: null == yearOfBirth
          ? _value.yearOfBirth
          : yearOfBirth // ignore: cast_nullable_to_non_nullable
              as int,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SparkUserCopyWith<$Res> implements $SparkUserCopyWith<$Res> {
  factory _$$_SparkUserCopyWith(
          _$_SparkUser value, $Res Function(_$_SparkUser) then) =
      __$$_SparkUserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name, int yearOfBirth, String gender, String email, String uid});
}

/// @nodoc
class __$$_SparkUserCopyWithImpl<$Res>
    extends _$SparkUserCopyWithImpl<$Res, _$_SparkUser>
    implements _$$_SparkUserCopyWith<$Res> {
  __$$_SparkUserCopyWithImpl(
      _$_SparkUser _value, $Res Function(_$_SparkUser) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? yearOfBirth = null,
    Object? gender = null,
    Object? email = null,
    Object? uid = null,
  }) {
    return _then(_$_SparkUser(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      yearOfBirth: null == yearOfBirth
          ? _value.yearOfBirth
          : yearOfBirth // ignore: cast_nullable_to_non_nullable
              as int,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SparkUser with DiagnosticableTreeMixin implements _SparkUser {
  const _$_SparkUser(
      {required this.name,
      required this.yearOfBirth,
      required this.gender,
      required this.email,
      required this.uid});

  factory _$_SparkUser.fromJson(Map<String, dynamic> json) =>
      _$$_SparkUserFromJson(json);

  @override
  final String name;
  @override
  final int yearOfBirth;
  @override
  final String gender;
  @override
  final String email;
  @override
  final String uid;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SparkUser(name: $name, yearOfBirth: $yearOfBirth, gender: $gender, email: $email, uid: $uid)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SparkUser'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('yearOfBirth', yearOfBirth))
      ..add(DiagnosticsProperty('gender', gender))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('uid', uid));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SparkUser &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.yearOfBirth, yearOfBirth) ||
                other.yearOfBirth == yearOfBirth) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.uid, uid) || other.uid == uid));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, yearOfBirth, gender, email, uid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SparkUserCopyWith<_$_SparkUser> get copyWith =>
      __$$_SparkUserCopyWithImpl<_$_SparkUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SparkUserToJson(
      this,
    );
  }
}

abstract class _SparkUser implements SparkUser {
  const factory _SparkUser(
      {required final String name,
      required final int yearOfBirth,
      required final String gender,
      required final String email,
      required final String uid}) = _$_SparkUser;

  factory _SparkUser.fromJson(Map<String, dynamic> json) =
      _$_SparkUser.fromJson;

  @override
  String get name;
  @override
  int get yearOfBirth;
  @override
  String get gender;
  @override
  String get email;
  @override
  String get uid;
  @override
  @JsonKey(ignore: true)
  _$$_SparkUserCopyWith<_$_SparkUser> get copyWith =>
      throw _privateConstructorUsedError;
}
