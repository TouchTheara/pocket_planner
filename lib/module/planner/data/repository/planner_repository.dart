import 'package:flutter/material.dart';
import 'package:pocket_planner/module/planner/data/model/tesk_model/task_model.dart';
import 'package:pocket_planner/module/planner/domain/planner_base_repository.dart';
import 'package:pocket_planner/util/helper/dio_bese_helper.dart';

import '../../../../core/service_locator/service_locator.dart';
import '../model/planner_model.dart';

class PlannerRepository implements PlannerRepositoryBase {
  @override
  Future<List<PlannerModel>> getPlannerData() async {
    var plannerList = <PlannerModel>[];

    await getIt<DioBaseHelper>()
        .onRequest(
            url: "get-active-planing", methode: METHODE.get, isAuthorize: true)
        .then((response) {
      response['result'].map((e) {
        plannerList.add(PlannerModel.fromJson(e));
      }).toList();

      debugPrint("------- get data success : ${response['result']}");
    }).onError((ErrorModel error, stackTrace) {
      debugPrint("on status error data : ${error.statusCode}");
      debugPrint("on status error data Body: ${error.bodyString}");
    });
    return plannerList;
  }

  @override
  Future<List<TaskModel>> getTaskData(BuildContext context, {int? id}) async {
    var taskList = <TaskModel>[];

    await getIt<DioBaseHelper>()
        .onRequest(
            url: "get-task-planing?id_ap=$id",
            methode: METHODE.get,
            isAuthorize: true)
        .then((response) {
      response['result'].map((e) {
        taskList.add(TaskModel.fromJson(e));
      }).toList();

      debugPrint("------- get data success : ${response['result']}");
    }).onError((ErrorModel error, stackTrace) {
      debugPrint("on status error data : ${error.statusCode}");
      debugPrint("on status error data Body: ${error.bodyString}");
    });
    return taskList;
  }

  @override
  Future<void> createPlannerData(BuildContext context,
      {String? priorityApp,
      String? startDateApp,
      String? endDateApp,
      String? description,
      String? title,
      Function? functionSuccess}) async {
    await getIt<DioBaseHelper>().onRequest(
        url: "create-active-planing",
        methode: METHODE.post,
        isAuthorize: true,
        body: {
          "title_ap": title,
          "priority_ap": priorityApp ?? "High",
          "start_date_ap": startDateApp ?? "11/12/2022",
          "end_date_ap": endDateApp ?? "11/09/2023",
          "description": description ?? "not hard 2"
        }).then((response) {
      functionSuccess?.call();

      debugPrint("------- get data success project : $response");
    }).onError((ErrorModel error, stackTrace) {
      debugPrint("on status error data : ${error.statusCode}");
      debugPrint("on status error data Body: ${error.bodyString}");
    });
  }

  @override
  Future<void> createTaskData(BuildContext context,
      {int? iDApp,
      bool? isdone,
      String? title,
      String? status,
      String? desciption,
      String? estimatetime,
      String? progress,
      String? date,
      String? priority,
      Function? functionSuccess}) async {
    await getIt<DioBaseHelper>().onRequest(
        url: "create-task-planing",
        methode: METHODE.post,
        isAuthorize: true,
        body: {
          "id_ap": iDApp ?? 25,
          "isdone": isdone ?? true,
          "title": title ?? "good",
          "status": status ?? "start",
          "desciption": desciption ?? "hello new task",
          "estimatetime": estimatetime ?? "3days",
          "progress": progress ?? "40%",
          "date": date ?? "11-23-2022",
          "priority": priority ?? "low"
        }).then((response) {
      functionSuccess?.call();

      debugPrint("------- get data success task : $response");
    }).onError((ErrorModel error, stackTrace) {
      debugPrint("on status error data : ${error.statusCode}");
      debugPrint("on status error data Body: ${error.bodyString}");
    });
  }
}
