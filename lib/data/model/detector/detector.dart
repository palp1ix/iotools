import 'package:json_annotation/json_annotation.dart';

part 'detector.g.dart';

@JsonSerializable()
class Detector {
  Detector({
    required this.id,
    required this.name,
    required this.currentMetricsValue,
    required this.currentMetricsType,
    required this.currentMetricsUnit,
    required this.roomId,
    this.minValue,
    this.maxValue,
  });

  final int id;
  final String name;
  final int currentMetricsValue;
  final String currentMetricsType;
  final String currentMetricsUnit;
  final int roomId;
  final int? minValue;
  final int? maxValue;

  factory Detector.fromJson(Map<String, dynamic> json) =>
      _$DetectorFromJson(json);

  Map<String, dynamic> toJson() => _$DetectorToJson(this);
}
