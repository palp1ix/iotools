// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metrics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Metrics _$MetricsFromJson(Map<String, dynamic> json) => Metrics(
  id: (json['id'] as num).toInt(),
  detectorId: (json['detectorId'] as num).toInt(),
  value: (json['value'] as num).toInt(),
  timestamp: DateTime.parse(json['timestamp'] as String),
  type: json['type'] as String,
  unit: json['unit'] as String,
);

Map<String, dynamic> _$MetricsToJson(Metrics instance) => <String, dynamic>{
  'id': instance.id,
  'detectorId': instance.detectorId,
  'value': instance.value,
  'timestamp': instance.timestamp.toIso8601String(),
  'type': instance.type,
  'unit': instance.unit,
};
