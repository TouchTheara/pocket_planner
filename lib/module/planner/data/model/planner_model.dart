// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'planner_model.freezed.dart';
part 'planner_model.g.dart';

@freezed
class PlannerModel with _$PlannerModel {
  factory PlannerModel({
    @JsonKey(name: "record_type") String? recordType,
    @JsonKey(name: "id_ap") String? idApp,
    @JsonKey(name: "user_name") String? userName,
    @JsonKey(name: "public_id_image") String? imageApp,
    @JsonKey(name: "title_ap") String? titleApp,
    @JsonKey(name: "priority_ap") String? priorityApp,
    @JsonKey(name: "start_date_ap") String? startDateApp,
    @JsonKey(name: "end_date_ap") String? endDateApp,
    @JsonKey(name: "description") String? description,
    @JsonKey(name: "is_owner") bool? isOwner,
    @JsonKey(name: "project_type") String? projectType,
    @JsonKey(name: "image_url") String? imageUrl,
    @JsonKey(name: "ispin") bool? ispin,
  }) = _PlannerModel;

  factory PlannerModel.fromJson(Map<String, dynamic> json) =>
      _$PlannerModelFromJson(json);
}
