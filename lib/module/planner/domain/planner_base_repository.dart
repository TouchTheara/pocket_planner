import 'package:flutter/cupertino.dart';

import '../data/model/planner_model.dart';
import '../data/model/tesk_model/task_model.dart';

abstract class PlannerRepositoryBase {
  Future<List<PlannerModel>> getPlannerData();
  Future<List<TaskModel>> getTaskData(BuildContext context, {int id});
  Future<void> createPlannerData(BuildContext context,
      {String priorityApp,
      String startDateApp,
      String endDateApp,
      String description,
      String? title,
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
