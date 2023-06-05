// ignore_for_file: await_only_futures

import 'package:flutter/material.dart';
import 'package:pocket_planner/module/planner/data/model/tesk_model/task_model.dart';
import 'package:pocket_planner/module/planner/domain/planner_base_repository.dart';
import 'package:pocket_planner/module/planner/presentation/logic/planner_controller.dart';
import 'package:pocket_planner/util/helper/dio_bese_helper.dart';

import '../../../../core/auth/presentation/logic/auth_controller.dart';
import '../../../../core/service_locator/service_locator.dart';
import '../model/planner_model.dart';

class PlannerRepository implements PlannerRepositoryBase {
  ////=======================>>>>Task Block<<<<==============/////

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
          "id_ap": iDApp,
          "isdone": isdone,
          "title": title,
          "status": status,
          "desciption": desciption,
          "estimatetime": estimatetime,
          "progress": progress,
          "date": date,
          "priority": priority
        }).then((response) {
      functionSuccess?.call();

      debugPrint("------- get data success task : $response");
    }).onError((ErrorModel error, stackTrace) {
      debugPrint("on status error data : ${error.statusCode}");
      debugPrint("on status error data Body: ${error.bodyString}");
    });
  }

  @override
  Future<void> udpateTaskData(BuildContext context,
      {required int iDTask,
      int? iDApp,
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
        url: "update-task-planing?id_task=$iDTask",
        methode: METHODE.put,
        isAuthorize: true,
        body: {
          "id_ap": iDApp,
          "isdone": isdone,
          "title": title,
          "status": status,
          "desciption": desciption,
          "estimatetime": estimatetime,
          "progress": progress,
          "date": date,
          "priority": priority
        }).then((response) {
      functionSuccess?.call();

      debugPrint("------- get data success task : $response");
    }).onError((ErrorModel error, stackTrace) {
      debugPrint("on status error data : ${error.statusCode}");
      debugPrint("on status error data Body: ${error.bodyString}");
    });
  }

  @override
  Future<void> deleteTaskData(BuildContext context,
      {required int taskId, Function? functionSuccess}) async {
    await getIt<DioBaseHelper>()
        .onRequest(
      url: "delete-task-planing?id_task=$taskId",
      methode: METHODE.delete,
      isAuthorize: true,
    )
        .then((response) {
      debugPrint(' ============= > $response');
      functionSuccess?.call();
    }).onError((ErrorModel error, stackTrace) {
      debugPrint("on status error data deleteTaskData : ${error.statusCode}");
      debugPrint(
          "on status error data Body deleteTaskData: ${error.bodyString}");
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
      debugPrint("on status error data getTaskData: ${error.statusCode}");
      debugPrint("on status error data Body getTaskData: ${error.bodyString}");
    });
    return taskList;
  }

  //////////////////////////////End/////////////////////////////////

  ///==================>>>>Project Block<<<<<=====================/////

  @override
  Future<List<PlannerModel>> getPlannerData(
      {int page = 1, Function? errorTokenFunc}) async {
    var plannerList = <PlannerModel>[];

    await getIt<DioBaseHelper>()
        .onRequest(
            url: "get-active-planing", methode: METHODE.get, isAuthorize: true)
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
  Future<int> createPlannerData(BuildContext context,
      {String? priorityApp,
      String? startDateApp,
      String? endDateApp,
      String? description,
      String? title,
      bool? ispin,
      bool? isOwner,
      String? projectType,
      // String? progressAp,
      Function? functionSuccess}) async {
    int? id;
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
          // "progress_ap": progressAp ?? "",
          "project_type": projectType ?? "",
          "ispin": ispin ?? false,
          "is_owner": isOwner ?? true
        }).then((response) async {
      functionSuccess?.call();

      debugPrint("------- get data success project : $response");
      // debugPrint("------- get data success ID : ${response['id_ap']}");

      id = response['id_ap'];
      debugPrint(
          "------- get data success ID : ${getIt<PlannerController>().getIdProject.value}");
    }).onError((ErrorModel error, stackTrace) {
      debugPrint("on status error data : ${error.statusCode}");
      debugPrint("on status error data Body: ${error.bodyString}");
    });
    return id!;
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
  Future<void> uploadProject({String? image, int? id}) async {
    await getIt<DioBaseHelper>()
        .onRequestFormData(
            url: "upload-ap-image?id=$id",
            keyName: "tag",
            valueName: "project",
            isAuthorize: true,
            filePath: image!)
        .then((value) {
      debugPrint(
          "---------- Success Upload Image Project: ${value.toString()}");
    }).onError((ErrorModel error, stackTrace) {
      debugPrint("on status error data : ${error.statusCode}");
      debugPrint("on status error data Body: ${error.bodyString}");
    });
  }
  ////////////////////////////////End//////////////////////////////////
}
