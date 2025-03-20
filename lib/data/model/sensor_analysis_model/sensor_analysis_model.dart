import 'package:json_annotation/json_annotation.dart';

part 'sensor_analysis_model.g.dart';

@JsonSerializable()
class SensorAnalysisModel {
  final Analysis analysis;

  SensorAnalysisModel({required this.analysis});

  factory SensorAnalysisModel.fromJson(Map<String, dynamic> json) =>
      _$SensorAnalysisModelFromJson(json);

  Map<String, dynamic> toJson() => _$SensorAnalysisModelToJson(this);
}

@JsonSerializable()
class Analysis {
  final SensorAnalysis sensorAnalysis;

  Analysis({required this.sensorAnalysis});

  factory Analysis.fromJson(Map<String, dynamic> json) =>
      _$AnalysisFromJson(json);

  Map<String, dynamic> toJson() => _$AnalysisToJson(this);
}

@JsonSerializable()
class SensorAnalysis {
  final Predictions predictions;
  final List<Recommendation> recommendations;

  SensorAnalysis({required this.predictions, required this.recommendations});

  factory SensorAnalysis.fromJson(Map<String, dynamic> json) =>
      _$SensorAnalysisFromJson(json);

  Map<String, dynamic> toJson() => _$SensorAnalysisToJson(this);
}

@JsonSerializable()
class Predictions {
  final ExceedanceProbabilities exceedanceProbabilities;
  final FailureRisk failureRisk;
  final NextExceedance nextExceedance;

  Predictions({
    required this.exceedanceProbabilities,
    required this.failureRisk,
    required this.nextExceedance,
  });

  factory Predictions.fromJson(Map<String, dynamic> json) =>
      _$PredictionsFromJson(json);

  Map<String, dynamic> toJson() => _$PredictionsToJson(this);
}

@JsonSerializable()
class ExceedanceProbabilities {
  @JsonKey(name: '14_days')
  final double days14;
  @JsonKey(name: '30_days')
  final double days30;
  @JsonKey(name: '7_days')
  final double days7;

  ExceedanceProbabilities({
    required this.days14,
    required this.days30,
    required this.days7,
  });

  factory ExceedanceProbabilities.fromJson(Map<String, dynamic> json) =>
      _$ExceedanceProbabilitiesFromJson(json);

  Map<String, dynamic> toJson() => _$ExceedanceProbabilitiesToJson(this);
}

@JsonSerializable()
class FailureRisk {
  final double confidence;
  final double probability;
  final String estimatedFailureDate;

  FailureRisk({
    required this.confidence,
    required this.probability,
    required this.estimatedFailureDate,
  });

  factory FailureRisk.fromJson(Map<String, dynamic> json) =>
      _$FailureRiskFromJson(json);

  Map<String, dynamic> toJson() => _$FailureRiskToJson(this);
}

@JsonSerializable()
class NextExceedance {
  final double confidence;
  final String date;

  NextExceedance({required this.confidence, required this.date});

  factory NextExceedance.fromJson(Map<String, dynamic> json) =>
      _$NextExceedanceFromJson(json);

  Map<String, dynamic> toJson() => _$NextExceedanceToJson(this);
}

@JsonSerializable()
class Recommendation {
  final String action;
  final String priority;
  final String reason;

  Recommendation({
    required this.action,
    required this.priority,
    required this.reason,
  });

  factory Recommendation.fromJson(Map<String, dynamic> json) =>
      _$RecommendationFromJson(json);

  Map<String, dynamic> toJson() => _$RecommendationToJson(this);
}
