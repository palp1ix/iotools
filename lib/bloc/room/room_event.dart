part of 'room_bloc.dart';

@immutable
sealed class RoomEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

final class GetRooms extends RoomEvent {}

final class CreateRoom extends RoomEvent {
  final Room room;

  CreateRoom({required this.room});
}
