// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_model.freezed.dart';
part 'task_model.g.dart';

@unfreezed
class TaskModel with _$TaskModel {
  factory TaskModel({
    @JsonKey(name: "id_ap") String? idApp,
    @JsonKey(name: "id_task") String? idTask,
    @JsonKey(name: "isdone") bool? isdone,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "status") String? status,
    @JsonKey(name: "desciption") String? desciption,
    @JsonKey(name: "progress") String? progress,
    @JsonKey(name: "date") String? date,
    @JsonKey(name: "priority") String? priority,
    @Default(false) bool isSelected,
  }) = _TaskModel;

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);
}
