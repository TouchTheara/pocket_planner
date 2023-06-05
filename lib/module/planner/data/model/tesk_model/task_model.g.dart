// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TaskModel _$$_TaskModelFromJson(Map<String, dynamic> json) => _$_TaskModel(
      idApp: json['id_ap'] as String?,
      idTask: json['id_task'] as String?,
      isdone: json['isdone'] as bool?,
      title: json['title'] as String?,
      status: json['status'] as String?,
      desciption: json['desciption'] as String?,
      progress: json['progress'] as String?,
      date: json['date'] as String?,
      priority: json['priority'] as String?,
      isSelected: json['isSelected'] as bool? ?? false,
    );

Map<String, dynamic> _$$_TaskModelToJson(_$_TaskModel instance) =>
    <String, dynamic>{
      'id_ap': instance.idApp,
      'id_task': instance.idTask,
      'isdone': instance.isdone,
      'title': instance.title,
      'status': instance.status,
      'desciption': instance.desciption,
      'progress': instance.progress,
      'date': instance.date,
      'priority': instance.priority,
      'isSelected': instance.isSelected,
    };
