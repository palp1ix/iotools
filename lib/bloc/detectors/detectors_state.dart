part of 'detectors_bloc.dart';

sealed class DetectorsState extends Equatable {
  const DetectorsState();

  @override
  List<Object> get props => [];
}

final class DetectorsInitial extends DetectorsState {}

final class DetectorsLoading extends DetectorsState {}

final class DetectorsLoaded extends DetectorsState {
  final List<Detector> detectors;
  const DetectorsLoaded(this.detectors);
}

final class DetectorsError extends DetectorsState {
  final String? message;
  const DetectorsError(this.message);
}
