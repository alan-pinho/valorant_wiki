import 'package:json_annotation/json_annotation.dart';

part 'ability_model.g.dart';

@JsonSerializable(createToJson: false)
class AbilityModel {
  final String slot;
  final String displayName;
  final String description;
  final String? displayIcon;

  AbilityModel(
    this.slot,
    this.displayName,
    this.description,
    this.displayIcon,
  );

  factory AbilityModel.fromJson(Map<String, dynamic> json) =>
      _$AbilityModelFromJson(json);
}
