import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iotools/data/model/datasource/remote/remote_datasoure.dart';

part 'introduce_event.dart';
part 'introduce_state.dart';

class IntroduceBloc extends Bloc<IntroduceEvent, IntroduceState> {
  final RemoteDatasoure remoteDatasoure;

  IntroduceBloc(this.remoteDatasoure) : super(IntroduceInitial()) {
    on<GetCompanyId>((event, emit) async {
      try {
        emit(IntroduceLoading());
        final companyId = await remoteDatasoure.getCompanyId(
          int.parse(event.code),
        );
        emit(IntroduceSuccess(companyId: companyId));
      } catch (e) {
        emit(IntroduceError());
      }
    });
  }
}
