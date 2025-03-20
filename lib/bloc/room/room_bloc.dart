import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iotools/data/datasource/remote/remote_datasoure.dart';
import 'package:iotools/data/model/room/room.dart';

part 'room_event.dart';
part 'room_state.dart';

class RoomBloc extends Bloc<RoomEvent, RoomState> {
  final RemoteDatasoure datasoure;
  RoomBloc(this.datasoure) : super(RoomInitial()) {
    on<GetRooms>((event, emit) async {
      try {
        emit(RoomLoading());
        final rooms = await datasoure.getRooms();
        emit(RoomLoaded(rooms));
      } catch (e) {
        emit(RoomError(e.toString()));
      }
    });

    on<CreateRoom>((event, emit) async {
      try {
        emit(RoomLoading());
        await datasoure.createRoom(event.room);
        emit(RoomCreated());
      } catch (e) {
        emit(RoomError(e.toString()));
      }
    });
  }
}
