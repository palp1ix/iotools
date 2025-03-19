import 'package:json_annotation/json_annotation.dart';

part 'company.g.dart';

@JsonSerializable()
class Company {
  Company({
    required this.id,
    required this.name,
    required this.code,
    this.masterId,
  });

  final int id;
  final String name;
  final String code;
  final int? masterId;

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyToJson(this);
}
