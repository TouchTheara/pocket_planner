import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

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

  ///init value:
  final hintTextProjectPriority = ''.obs;
  final hintTextTaskPriority = ''.obs;
  final hintTextTaskDueDate = ''.obs;
  final hintTextProjectDueDate = ''.obs;

  final getValueDropDown1 = ''.obs;
  final getValueDropDown2 = ''.obs;
  final startDate = ''.obs;
  final endDate = ''.obs;
  final projectName = ''.obs;
  final projectDisciption = ''.obs;
  final projectPriority = ''.obs;
  final projectStartDate = ''.obs;
  final projectEndDate = ''.obs;
  final projectCover = ''.obs;
  final projectMember = <String>[].obs;

  // Rxn<DateTime> startDate = Rxn<DateTime>();
  // Rxn<DateTime> endDate = Rxn<DateTime>();

  final memberList = <Object>[].obs;
  final isLoading = false.obs;

  ///Function Fetch Data Planner:
  var plannerDataList = <PlannerModel>[].obs;
  final pagePlanData = 1.obs;
  Future<List<PlannerModel>> functionFetchDataPlanner() async {
    isLoading(true);
    await getIt<PlannerRepository>()
        .getPlannerData(
      page: pagePlanData.value,
    )
        .then((value) {
      isLoading(false);
      plannerDataList.value = value;
      update();
      refresh();
    });
    isLoading(false);
    refresh();
    return plannerDataList;
  }

  Future<void> functionDeleteDataPlanner(BuildContext context,
      {required int id, Function? functionSuccess}) async {
    isLoading(true);
    await getIt<PlannerRepository>()
        .deletePlannerData(context, appId: id, functionSuccess: functionSuccess)
        .then((value) {
      update();
      isLoading(false);
    });
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

  ///Function Create Data Planner:

  functionUpdatePlanner(BuildContext context,
      {String? priorityApp,
      required int id,
      String? startDateApp,
      String? endDateApp,
      String? description,
      String? title,
      bool? ispin,
      String? projectType,
      String? progressAp,
      Function? functionSuccess}) async {
    isLoading(true);
    await getIt<PlannerRepository>().updatePlannerData(context,
        id: id,
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
      await getIt<PlannerController>().functionFetchDataPlanner();
    } catch (e) {
      debugPrint("-------- $e");
    }
  }

  functionSuccessUpdateData(BuildContext context) async {
    try {
      context.pop('/');
      await getIt<PlannerController>().functionFetchDataPlanner();
    } catch (e) {
      debugPrint("-------- $e");
    }
  }

  functionSuccessCreateTask(BuildContext context, {String? id}) async {
    try {
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

  Future getImage() async {
    File? image;
    final picker = ImagePicker();

    var pickedFile = await picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 50, // <- Reduce Image quality
        maxHeight: 500, // <- reduce the image size
        maxWidth: 500);

    image = File(pickedFile!.path);

    // funcUploadProjectImage(image);
  }

  // funcUploadProjectImage(File file) async {
  //   String fileName = file.path.split('/').last;
  //   FormData formData = FormData.fromMap({
  //     "file": await MultipartFile.fromFile(file.path, filename: fileName),
  //   });

  //   var response = await dio.post("/info", data: formData);
  //   return response.data['id'];
  // }

  @override
  void onInit() {
    // functionTesting();

    // getIt<PlannerRepository>().getPlannerData();
    super.onInit();
  }
}
