part of 'detectors_bloc.dart';

sealed class DetectorsEvent extends Equatable {
  const DetectorsEvent();

  @override
  List<Object> get props => [];
}

final class GetDetectors extends DetectorsEvent {}
