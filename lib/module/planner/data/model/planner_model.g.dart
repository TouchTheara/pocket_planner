// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'planner_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PlannerModel _$$_PlannerModelFromJson(Map<String, dynamic> json) =>
    _$_PlannerModel(
      recordType: json['record_type'] as String?,
      idApp: json['id_ap'] as String?,
      userName: json['user_name'] as String?,
      imageApp: json['public_id_image'] as String?,
      titleApp: json['title_ap'] as String?,
      priorityApp: json['priority_ap'] as String?,
      startDateApp: json['start_date_ap'] as String?,
      endDateApp: json['end_date_ap'] as String?,
      description: json['description'] as String?,
      progressAp: json['progress_ap'] as String?,
      projectType: json['project_type'] as String?,
      ispin: json['ispin'] as bool?,
    );

Map<String, dynamic> _$$_PlannerModelToJson(_$_PlannerModel instance) =>
    <String, dynamic>{
      'record_type': instance.recordType,
      'id_ap': instance.idApp,
      'user_name': instance.userName,
      'public_id_image': instance.imageApp,
      'title_ap': instance.titleApp,
      'priority_ap': instance.priorityApp,
      'start_date_ap': instance.startDateApp,
      'end_date_ap': instance.endDateApp,
      'description': instance.description,
      'progress_ap': instance.progressAp,
      'project_type': instance.projectType,
      'ispin': instance.ispin,
    };
