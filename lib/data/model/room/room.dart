import 'package:json_annotation/json_annotation.dart';

part 'room.g.dart';

@JsonSerializable()
class Room {
  Room({
    required this.id,
    required this.name,
    required this.companyId,
    required this.ownerId,
  });

  final int id;
  final String name;
  final int companyId;
  final int ownerId;

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);

  Map<String, dynamic> toJson() => _$RoomToJson(this);
}
