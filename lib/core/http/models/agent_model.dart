import 'package:json_annotation/json_annotation.dart';
import 'package:valowiki/core/http/models/ability_model.dart';
import 'package:valowiki/core/http/models/recruitment_model.dart';
import 'package:valowiki/core/http/models/role_model.dart';

part 'agent_model.g.dart';

@JsonSerializable(createToJson: false)
class AgentModel {
  final String uuid;
  final String displayName;
  final String description;
  final String developerName;
  final String assetPath;
  final String? displayIcon;
  final String? displayIconSmall;
  final String? bustPortrait;
  final String? fullPortrait;
  final String? fullPortraitV2;
  final String? killfeedPortrait;
  final String? background;
  final bool isBaseContent;
  final bool isAvailableForTest;
  final bool isPlayableCharacter;
  final bool isFullPortraitRightFacing;
  final List<String> backgroundGradientColors;
  final List<AbilityModel> abilities;
  final List<String>? characterTags;
  final RoleModel? role;
  final RecruitmentModel? recruitmentData;

  AgentModel(
    this.uuid,
    this.displayName,
    this.description,
    this.developerName,
    this.assetPath,
    this.displayIcon,
    this.displayIconSmall,
    this.bustPortrait,
    this.fullPortrait,
    this.fullPortraitV2,
    this.killfeedPortrait,
    this.background,
    this.isBaseContent,
    this.isAvailableForTest,
    this.isPlayableCharacter,
    this.isFullPortraitRightFacing,
    this.backgroundGradientColors,
    this.abilities,
    this.characterTags,
    this.role,
    this.recruitmentData,
  );

  factory AgentModel.fromJson(Map<String, dynamic> json) =>
      _$AgentModelFromJson(json);
}
