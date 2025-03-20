import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'room.g.dart';

@JsonSerializable(includeIfNull: false)
class Room extends Equatable {
  const Room({
    this.id,
    required this.name,
    required this.companyId,
    required this.ownerId,
  });

  final int? id;
  final String name;
  final int companyId;
  final int ownerId;

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);

  Map<String, dynamic> toJson() => _$RoomToJson(this);

  @override
  List<Object?> get props => [id, name, companyId, ownerId];
}
