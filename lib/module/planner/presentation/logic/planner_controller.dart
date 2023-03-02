import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import 'package:injectable/injectable.dart';
import 'package:pocket_planner/core/service_locator/service_locator.dart';
import 'package:pocket_planner/module/planner/data/model/tesk_model/task_model.dart';
import 'package:pocket_planner/util/helper/local_data/get_local_data.dart';

import '../../data/model/planner_model.dart';
import '../../data/repository/planner_repository.dart';

class PlannerController extends GetxController {
  @factoryMethod
  static init() => Get.put(PlannerController());

  ///Controller:

  final projectNameController = TextEditingController().obs;
  final projectNameValidator = false.obs;
  final descriptionController = TextEditingController().obs;
  final descriptionValidator = false.obs;

  final priorityController = TextEditingController().obs;
  final priorityValidator = false.obs;
  final selectionDueDateController = TextEditingController().obs;
  final selectionDueDateValidator = false.obs;

  final taskNameController = TextEditingController().obs;
  final taskNameValidator = false.obs;
  final descriptionTaskController = TextEditingController().obs;
  final descriptionTaskValidator = false.obs;

  final priorityTaskController = TextEditingController().obs;
  final priorityTaskValidator = false.obs;
  final selectionDueDateTaskController = TextEditingController().obs;
  final selectionDueDateTaskValidator = false.obs;
  final hintTextProjectPriority = ''.obs;
  final hintTextTaskPriority = ''.obs;
  final hintTextTaskDueDate = ''.obs;
  final hintTextProjectDueDate = ''.obs;

  final getValueDropDown1 = ''.obs;
  final getValueDropDown2 = ''.obs;
  final startDate = ''.obs;
  final endDate = ''.obs;
  // Rxn<DateTime> startDate = Rxn<DateTime>();
  // Rxn<DateTime> endDate = Rxn<DateTime>();

  final memberList = <Object>[].obs;
  final isLoading = false.obs;

  ///Function Fetch Data Planner:
  var plannerDataList = <PlannerModel>[];
  final pagePlanData = 1.obs;
  Future<List<PlannerModel>> functionFetchDataPlanner() async {
    isLoading(true);
    getIt<PlannerRepository>()
        .getPlannerData(page: pagePlanData.value)
        .then((value) {
      plannerDataList = value;
      // debugPrint("-----success get controller Planner ==$value}");
      isLoading(false);
    });
    return plannerDataList;
  }

  ///Function Fetch Data Planner:
  final taskDataList = <TaskModel>[].obs;
  Future<List<TaskModel>> functionFetchDataTask(BuildContext context,
      {String? id}) async {
    isLoading(true);
    getIt<PlannerRepository>().getTaskData(context, id: id).then((value) {
      taskDataList.value = value;
      debugPrint("-----success get controller Planner ==$value}");
      isLoading(false);
    });
    return taskDataList;
  }

  ///Function Create Data Planner:

  functionCreatePlanner(BuildContext context,
      {String? priorityApp,
      String? startDateApp,
      String? endDateApp,
      String? description,
      String? title,
      bool? ispin,
      String? projectType,
      String? progressAp,
      Function? functionSuccess}) async {
    isLoading(true);
    await getIt<PlannerRepository>().createPlannerData(context,
        title: title,
        priorityApp: priorityApp,
        functionSuccess: functionSuccess,
        endDateApp: endDateApp,
        startDateApp: startDateApp,
        description: description,
        ispin: ispin,
        progressAp: progressAp,
        projectType: projectType);
    isLoading(false);
  }

  ///Function Create Task :

  functionCreateTask(BuildContext context,
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
    isLoading(true);
    await getIt<PlannerRepository>().createTaskData(context,
        iDApp: iDApp,
        isdone: isdone,
        title: title,
        status: status,
        desciption: desciption,
        estimatetime: estimatetime,
        date: date,
        progress: progress,
        priority: priority,
        functionSuccess: functionSuccess);
    isLoading(false);
  }

  functionTesting() async {
    var token = await LocalDataStorage.getCurrentUser();
    debugPrint("===========Testing $token");
  }

  functionSuccessCreateData(BuildContext context) async {
    try {
      context.pop();
      projectNameController.value.clear();
      selectionDueDateController.value.clear();
      startDate.value = '';
      endDate.value = '';
      descriptionController.value.clear();
      priorityController.value.clear();
      await getIt<PlannerController>().functionFetchDataPlanner();
    } catch (e) {
      debugPrint("-------- $e");
    }
  }

  functionSuccessCreateTask(BuildContext context, {String? id}) async {
    try {
      context.pop();
      taskNameController.value.clear();
      selectionDueDateTaskController.value.clear();
      startDate.value = '';
      endDate.value = '';
      descriptionTaskController.value.clear();
      priorityTaskController.value.clear();
      await getIt<PlannerController>().functionFetchDataTask(context, id: id);
    } catch (e) {
      debugPrint("----------$e");
    }
  }

  @override
  void onInit() {
    functionTesting();
    functionFetchDataPlanner();
    getIt<PlannerRepository>().getPlannerData();
    super.onInit();
  }
}
