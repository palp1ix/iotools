import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iotools/data/datasource/remote/remote_datasoure.dart';
import 'package:iotools/data/model/metrics/metrics.dart';
import 'package:iotools/data/model/detector/detector.dart';
import 'package:iotools/data/model/sensor_analysis_model/sensor_analysis_model.dart';

class SensorCubit extends Cubit<SensorState> {
  final RemoteDatasoure datasource;
  SensorCubit(this.datasource) : super(SensorLoading());

  void loadSensorData(Detector detector) async {
    emit(SensorLoading());
    final analysis = await datasource.getAnalytics(detector);

    // // Пример данных (обычно загружаются из API)
    // final analysis = SensorAnalysisModel(
    //   analysis: Analysis(
    //     sensorAnalysis: SensorAnalysis(
    //       predictions: Predictions(
    //         exceedanceProbabilities: ExceedanceProbabilities(
    //           days7: 0.1,
    //           days14: 0.2,
    //           days30: 0.4,
    //         ),
    //         failureRisk: FailureRisk(
    //           confidence: 0.8,
    //           probability: 0.6,
    //           estimatedFailureDate: "2024-05-20T12:00:00Z",
    //         ),
    //         nextExceedance: NextExceedance(
    //           confidence: 0.7,
    //           date: "2024-02-15T08:00:00Z",
    //         ),
    //       ),
    //       recommendations: [
    //         Recommendation(
    //           action: "Проверить сенсор",
    //           priority: "high",
    //           reason: "Высокая вероятность превышения",
    //         ),
    //         Recommendation(
    //           action: "Запланировать замену сенсора",
    //           priority: "medium",
    //           reason: "Риск отказа сенсора",
    //         ),
    //       ],
    //     ),
    //   ),
    // );

    final metrics = List.generate(
      10,
      (index) => Metrics(
        id: index,
        detectorId: 1,
        value: (50 + index * index),
        timestamp: DateTime.now().subtract(Duration(hours: 10 - index)),
        type: "Температура",
        unit: "°C",
      ),
    );

    emit(SensorLoaded(analysis: analysis, metrics: metrics));
  }
}

abstract class SensorState extends Equatable {
  @override
  List<Object> get props => [];
}

class SensorLoading extends SensorState {}

class SensorLoaded extends SensorState {
  final SensorAnalysisModel analysis;
  final List<Metrics> metrics;

  SensorLoaded({required this.analysis, required this.metrics});

  @override
  List<Object> get props => [analysis, metrics];
}

class SensorError extends SensorState {}

abstract class SensorEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadSensorData extends SensorEvent {}
