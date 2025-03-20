part of 'devices_info_bloc.dart';

@immutable
sealed class DevicesInfoState {}

final class DevicesInfoInitial extends DevicesInfoState {}

final class DevicesInfoLoading extends DevicesInfoState {}

final class DevicesInfoSuccess extends DevicesInfoState {
  final List<Detector> detectors;
  DevicesInfoSuccess({required this.detectors});
}

final class DevicesInfoFailure extends DevicesInfoState {
  final String error;
  DevicesInfoFailure({required this.error});
}
