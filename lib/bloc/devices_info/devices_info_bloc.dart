import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iotools/data/datasource/remote/remote_datasoure.dart';
import 'package:iotools/data/model/detector/detector.dart';

part 'devices_info_event.dart';
part 'devices_info_state.dart';

class DevicesInfoBloc extends Bloc<DevicesInfoEvent, DevicesInfoState> {
  final RemoteDatasoure datasource;
  DevicesInfoBloc(this.datasource) : super(DevicesInfoInitial()) {
    on<GetDetectors>((event, emit) async {
      emit(DevicesInfoLoading());
      try {
        final result = await datasource.getDetectors();
        emit(DevicesInfoSuccess(detectors: result));
      } catch (e) {
        emit(DevicesInfoFailure(error: e.toString()));
      }
    });
  }
}
