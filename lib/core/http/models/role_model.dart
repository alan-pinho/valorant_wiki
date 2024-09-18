import 'package:json_annotation/json_annotation.dart';

part 'role_model.g.dart';

@JsonSerializable(createToJson: false)
class RoleModel {
  final String uuid;
  final String displayName;
  final String description;
  final String displayIcon;
  final String assetPath;

  RoleModel(
    this.uuid,
    this.displayName,
    this.description,
    this.displayIcon,
    this.assetPath,
  );

  factory RoleModel.fromJson(Map<String, dynamic> json) =>
      _$RoleModelFromJson(json);
}
