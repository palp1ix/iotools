import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'devices_info_event.dart';
part 'devices_info_state.dart';

class DevicesInfoBloc extends Bloc<DevicesInfoEvent, DevicesInfoState> {
  DevicesInfoBloc() : super(DevicesInfoInitial()) {
    on<DevicesInfoEvent>((event, emit) {});
  }
}
