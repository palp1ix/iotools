// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
  companyId: (json['companyId'] as num?)?.toInt(),
  isMaster: json['isMaster'] as bool?,
  name: json['name'] as String?,
  email: json['email'] as String,
  password: json['password'] as String,
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  if (instance.companyId case final value?) 'companyId': value,
  if (instance.isMaster case final value?) 'isMaster': value,
  if (instance.name case final value?) 'name': value,
  'email': instance.email,
  'password': instance.password,
};
