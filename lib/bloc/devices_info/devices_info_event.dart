part of 'devices_info_bloc.dart';

@immutable
sealed class DevicesInfoEvent {}

final class GetDetectors extends DevicesInfoEvent {}
