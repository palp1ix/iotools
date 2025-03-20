import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iotools/data/datasource/remote/remote_datasoure.dart';
import 'package:iotools/data/model/detector/detector.dart';

part 'detectors_event.dart';
part 'detectors_state.dart';

class DetectorsBloc extends Bloc<DetectorsEvent, DetectorsState> {
  final RemoteDatasoure datasource;
  DetectorsBloc(this.datasource) : super(DetectorsInitial()) {
    on<GetDetectors>((event, emit) async {
      try {
        emit(DetectorsLoading());
        await Future.delayed(const Duration(seconds: 1));
        final detectors = await datasource.getDetectors();
        emit(DetectorsLoaded(detectors));
      } catch (e) {
        emit(DetectorsError(''));
      }
    });
  }
}
