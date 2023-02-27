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
      imageApp: json['image_ap'] as String?,
      titleApp: json['title_ap'] as String?,
      priorityApp: json['priority_ap'] as String?,
      startDateApp: json['start_date_ap'] as String?,
      endDateApp: json['end_date_ap'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$_PlannerModelToJson(_$_PlannerModel instance) =>
    <String, dynamic>{
      'record_type': instance.recordType,
      'id_ap': instance.idApp,
      'user_name': instance.userName,
      'image_ap': instance.imageApp,
      'title_ap': instance.titleApp,
      'priority_ap': instance.priorityApp,
      'start_date_ap': instance.startDateApp,
      'end_date_ap': instance.endDateApp,
      'description': instance.description,
    };
