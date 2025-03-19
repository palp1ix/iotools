import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(includeIfNull: false)
class User {
  final int? companyId;
  final bool? isMaster;
  final String? name;
  final String email;
  final String password;

  User({
    this.companyId,
    this.isMaster,
    this.name,
    required this.email,
    required this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
