import 'package:flutter/cupertino.dart';

import '../data/model/planner_model.dart';
import '../data/model/tesk_model/task_model.dart';

abstract class PlannerRepositoryBase {
  Future<List<PlannerModel>> getPlannerData({
    int page = 1,
  });
  Future<void> deletePlannerData(BuildContext context,
      {required int appId, Function functionSuccess});
  Future<void> deleteTaskData(BuildContext context,
      {required int taskId, Function functionSuccess});
  Future<List<TaskModel>> getTaskData(BuildContext context, {String id});
  Future<void> createPlannerData(BuildContext context,
      {String priorityApp,
      String startDateApp,
      String endDateApp,
      String description,
      String? title,
      bool? ispin,
      bool? isOwner,
      String? projectType,
      // String? progressAp,
      Function functionSuccess});
  Future<void> updatePlannerData(BuildContext context,
      {required int id,
      String priorityApp,
      String startDateApp,
      String endDateApp,
      String description,
      String? title,
      bool? ispin,
      bool? isOwner,
      String? projectType,
      String? progressAp,
      Function functionSuccess});
  Future<void> createTaskData(BuildContext context,
      {int iDApp,
      bool isdone,
      String title,
      String status,
      String desciption,
      String estimatetime,
      String progress,
      String date,
      String priority,
      Function functionSuccess});
  Future<void> udpateTaskData(BuildContext context,
      {required int iDTask,
      int iDApp,
      bool isdone,
      String title,
      String status,
      String desciption,
      String estimatetime,
      String progress,
      String date,
      String priority,
      Function functionSuccess});
  Future<void> uploadProject({String? image, int id});
}
