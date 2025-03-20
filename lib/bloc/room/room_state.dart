part of 'room_bloc.dart';

@immutable
sealed class RoomState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class RoomInitial extends RoomState {}

final class RoomLoading extends RoomState {}

final class RoomLoaded extends RoomState {
  final List<Room> rooms;

  RoomLoaded(this.rooms);
}

final class RoomCreated extends RoomState {}

final class RoomError extends RoomState {
  final String message;

  RoomError(this.message);
}
