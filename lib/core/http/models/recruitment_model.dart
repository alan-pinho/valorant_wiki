import 'package:json_annotation/json_annotation.dart';

part 'recruitment_model.g.dart';

@JsonSerializable(createToJson: false)
class RecruitmentModel {
  final String counterId;
  final String milestoneId;
  final DateTime startDate;
  final DateTime endDate;
  final num milestoneThreshold;
  final num levelVpCostOverride;
  final bool useLevelVpCostOverride;

  RecruitmentModel(
    this.counterId,
    this.milestoneId,
    this.startDate,
    this.endDate,
    this.milestoneThreshold,
    this.levelVpCostOverride,
    this.useLevelVpCostOverride,
  );

  factory RecruitmentModel.fromJson(Map<String, dynamic> json) =>
      _$RecruitmentModelFromJson(json);
}
