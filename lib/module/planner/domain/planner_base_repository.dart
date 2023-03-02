import 'package:flutter/cupertino.dart';

import '../data/model/planner_model.dart';
import '../data/model/tesk_model/task_model.dart';

abstract class PlannerRepositoryBase {
  Future<List<PlannerModel>> getPlannerData({int page = 1});
  Future<List<TaskModel>> getTaskData(BuildContext context, {String id});
  Future<void> createPlannerData(BuildContext context,
      {String priorityApp,
      String startDateApp,
      String endDateApp,
      String description,
      String? title,
      bool? ispin,
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
}
