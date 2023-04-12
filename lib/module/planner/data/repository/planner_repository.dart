// ignore_for_file: await_only_futures

import 'package:flutter/material.dart';
import 'package:pocket_planner/module/planner/data/model/tesk_model/task_model.dart';
import 'package:pocket_planner/module/planner/domain/planner_base_repository.dart';
import 'package:pocket_planner/util/helper/dio_bese_helper.dart';

import '../../../../core/auth/presentation/logic/auth_controller.dart';
import '../../../../core/service_locator/service_locator.dart';
import '../model/planner_model.dart';

class PlannerRepository implements PlannerRepositoryBase {
  @override
  Future<List<PlannerModel>> getPlannerData(
      {int page = 1, Function? errorTokenFunc}) async {
    var plannerList = <PlannerModel>[];

    await getIt<DioBaseHelper>()
        .onRequest(
            url: "get-active-planing?page=1",
            methode: METHODE.get,
            isAuthorize: true)
        .then((response) {
      response['result'].map((e) {
        plannerList.add(PlannerModel.fromJson(e));
      }).toList();

      // debugPrint(
      //     "############# get data success Planner : ${response['result']}");
    }).onError((
      ErrorModel error,
      stackTrace,
    ) async {
      if (error.statusCode == 401 || error.statusCode == 403) {
        await getIt<AuthController>().getRefreshToken;
      }
      debugPrint("on status error data planner : ${error.statusCode}");
      debugPrint("on status error data Body planner: ${error.bodyString}");
    });
    return plannerList;
  }

  @override
  Future<void> deletePlannerData(BuildContext context,
      {required int appId, Function? functionSuccess}) async {
    await getIt<DioBaseHelper>()
        .onRequest(
      url: "delete-active-planing?id_ap=$appId",
      methode: METHODE.delete,
      isAuthorize: true,
    )
        .then((response) {
      debugPrint(' ============= > $response');
      functionSuccess?.call();
    }).onError((ErrorModel error, stackTrace) {
      debugPrint("on status error data planner : ${error.statusCode}");
      debugPrint("on status error data Body planner: ${error.bodyString}");
    });
  }

  @override
  Future<List<TaskModel>> getTaskData(BuildContext context,
      {String? id}) async {
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
      bool? ispin,
      bool? isOwner,
      String? projectType,
      String? progressAp,
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
          "description": description ?? "not hard 2",
          "progress_ap": progressAp ?? "",
          "project_type": projectType ?? "",
          "ispin": ispin ?? false,
          "is_owner": isOwner ?? true
        }).then((response) {
      functionSuccess?.call();

      debugPrint("------- get data success project : $response");
    }).onError((ErrorModel error, stackTrace) {
      debugPrint("on status error data : ${error.statusCode}");
      debugPrint("on status error data Body: ${error.bodyString}");
    });
  }

  @override
  Future<void> updatePlannerData(BuildContext context,
      {String? priorityApp,
      required int id,
      String? startDateApp,
      String? endDateApp,
      String? description,
      String? title,
      bool? ispin,
      bool? isOwner,
      String? projectType,
      String? progressAp,
      Function? functionSuccess}) async {
    await getIt<DioBaseHelper>().onRequest(
        url: "update-active-planing?id_ap=$id",
        methode: METHODE.put,
        isAuthorize: true,
        body: {
          "title_ap": title,
          "priority_ap": priorityApp ?? "High",
          "start_date_ap": startDateApp ?? "11/12/2022",
          "end_date_ap": endDateApp ?? "11/09/2023",
          "description": description ?? "not hard 2",
          "progress_ap": progressAp ?? "",
          "project_type": projectType ?? "",
          "ispin": ispin ?? false,
          "is_owner": isOwner ?? true
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
