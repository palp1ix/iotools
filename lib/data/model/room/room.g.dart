// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Room _$RoomFromJson(Map<String, dynamic> json) => Room(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String,
  companyId: (json['companyId'] as num).toInt(),
  ownerId: (json['ownerId'] as num).toInt(),
);

Map<String, dynamic> _$RoomToJson(Room instance) => <String, dynamic>{
  if (instance.id case final value?) 'id': value,
  'name': instance.name,
  'companyId': instance.companyId,
  'ownerId': instance.ownerId,
};
