// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detector.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Detector _$DetectorFromJson(Map<String, dynamic> json) => Detector(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  currentMetricsValue: (json['currentMetricsValue'] as num).toInt(),
  currentMetricsType: json['currentMetricsType'] as String,
  currentMetricsUnit: json['currentMetricsUnit'] as String,
  roomId: (json['roomId'] as num).toInt(),
  minValue: (json['minValue'] as num?)?.toInt(),
  maxValue: (json['maxValue'] as num?)?.toInt(),
);

Map<String, dynamic> _$DetectorToJson(Detector instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'currentMetricsValue': instance.currentMetricsValue,
  'currentMetricsType': instance.currentMetricsType,
  'currentMetricsUnit': instance.currentMetricsUnit,
  'roomId': instance.roomId,
  'minValue': instance.minValue,
  'maxValue': instance.maxValue,
};
