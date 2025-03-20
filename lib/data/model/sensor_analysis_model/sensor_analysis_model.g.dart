// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sensor_analysis_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SensorAnalysisModel _$SensorAnalysisModelFromJson(Map<String, dynamic> json) =>
    SensorAnalysisModel(
      analysis: Analysis.fromJson(json['analysis'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SensorAnalysisModelToJson(
  SensorAnalysisModel instance,
) => <String, dynamic>{'analysis': instance.analysis};

Analysis _$AnalysisFromJson(Map<String, dynamic> json) => Analysis(
  sensorAnalysis: SensorAnalysis.fromJson(
    json['sensorAnalysis'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$AnalysisToJson(Analysis instance) => <String, dynamic>{
  'sensorAnalysis': instance.sensorAnalysis,
};

SensorAnalysis _$SensorAnalysisFromJson(Map<String, dynamic> json) =>
    SensorAnalysis(
      predictions: Predictions.fromJson(
        json['predictions'] as Map<String, dynamic>,
      ),
      recommendations:
          (json['recommendations'] as List<dynamic>)
              .map((e) => Recommendation.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$SensorAnalysisToJson(SensorAnalysis instance) =>
    <String, dynamic>{
      'predictions': instance.predictions,
      'recommendations': instance.recommendations,
    };

Predictions _$PredictionsFromJson(Map<String, dynamic> json) => Predictions(
  exceedanceProbabilities: ExceedanceProbabilities.fromJson(
    json['exceedanceProbabilities'] as Map<String, dynamic>,
  ),
  failureRisk: FailureRisk.fromJson(
    json['failureRisk'] as Map<String, dynamic>,
  ),
  nextExceedance: NextExceedance.fromJson(
    json['nextExceedance'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$PredictionsToJson(Predictions instance) =>
    <String, dynamic>{
      'exceedanceProbabilities': instance.exceedanceProbabilities,
      'failureRisk': instance.failureRisk,
      'nextExceedance': instance.nextExceedance,
    };

ExceedanceProbabilities _$ExceedanceProbabilitiesFromJson(
  Map<String, dynamic> json,
) => ExceedanceProbabilities(
  days14: (json['14_days'] as num).toDouble(),
  days30: (json['30_days'] as num).toDouble(),
  days7: (json['7_days'] as num).toDouble(),
);

Map<String, dynamic> _$ExceedanceProbabilitiesToJson(
  ExceedanceProbabilities instance,
) => <String, dynamic>{
  '14_days': instance.days14,
  '30_days': instance.days30,
  '7_days': instance.days7,
};

FailureRisk _$FailureRiskFromJson(Map<String, dynamic> json) => FailureRisk(
  confidence: (json['confidence'] as num).toDouble(),
  probability: (json['probability'] as num).toDouble(),
  estimatedFailureDate: json['estimatedFailureDate'] as String,
);

Map<String, dynamic> _$FailureRiskToJson(FailureRisk instance) =>
    <String, dynamic>{
      'confidence': instance.confidence,
      'probability': instance.probability,
      'estimatedFailureDate': instance.estimatedFailureDate,
    };

NextExceedance _$NextExceedanceFromJson(Map<String, dynamic> json) =>
    NextExceedance(
      confidence: (json['confidence'] as num).toDouble(),
      date: json['date'] as String,
    );

Map<String, dynamic> _$NextExceedanceToJson(NextExceedance instance) =>
    <String, dynamic>{'confidence': instance.confidence, 'date': instance.date};

Recommendation _$RecommendationFromJson(Map<String, dynamic> json) =>
    Recommendation(
      action: json['action'] as String,
      priority: json['priority'] as String,
      reason: json['reason'] as String,
    );

Map<String, dynamic> _$RecommendationToJson(Recommendation instance) =>
    <String, dynamic>{
      'action': instance.action,
      'priority': instance.priority,
      'reason': instance.reason,
    };
