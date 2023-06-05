import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:pocket_planner/core/service_locator/service_locator.dart';
import 'package:pocket_planner/module/planner/data/model/tesk_model/task_model.dart';
import 'package:pocket_planner/module/profile/presentation/logic/profile_controller.dart';
import 'package:pocket_planner/util/helper/local_data/get_local_data.dart';

import '../../data/model/planner_model.dart';
import '../../data/repository/planner_repository.dart';

class PlannerController extends GetxController {
  @factoryMethod
  static init() => Get.put(PlannerController());

  final darkmode = false.obs;

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
  final advancedDrawerController = AdvancedDrawerController();
  final getIdProject = 0.obs;

  final projectImage = ''.obs;

  final getTaskID = ''.obs;

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
  final projectId = 0.obs;
  final projectMember = <String>[].obs;
  final messageByTime = ''.obs;
  final timeKhmer = 0.obs;

  // Rxn<DateTime> startDate = Rxn<DateTime>();
  // Rxn<DateTime> endDate = Rxn<DateTime>();

  final memberList = <Object>[].obs;
  final isLoading = false.obs;
  functionTesting() async {
    var token = await LocalDataStorage.getCurrentUser();
    debugPrint("===========Testing $token");
  }

  //////==============>>>Project Block<<<=================///////

  ///Function Fetch Data Planner:
  var plannerDataList = <PlannerModel>[].obs;
  final pagePlanData = 1.obs;
  Future<List<PlannerModel>> functionFetchDataPlanner(
      BuildContext context) async {
    isLoading(true);
    await getIt<PlannerRepository>()
        .getPlannerData(
      page: pagePlanData.value,
    )
        .then((value) async {
      isLoading(false);
      plannerDataList.value = value;

      update();
      refresh();
    }).then((value) {
      getIt<ProfileController>()
          .functionGetProfileData(context, isGoogle: false);
    });
    isLoading(false);
    refresh();
    return plannerDataList;
  }

  final isLoadingDeleteProject = false.obs;
  Future<void> functionDeleteDataPlanner(BuildContext context,
      {required int id, Function? functionSuccess}) async {
    try {
      isLoadingDeleteProject(true);
      await getIt<PlannerRepository>()
          .deletePlannerData(context,
              appId: id, functionSuccess: functionSuccess)
          .then((value) {
        update();
        isLoadingDeleteProject(false);
      });
    } catch (e) {
      debugPrint("$e");
    } finally {
      isLoadingDeleteProject(false);
    }
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
    await getIt<PlannerRepository>()
        .createPlannerData(context,
            title: title,
            priorityApp: priorityApp,
            functionSuccess: functionSuccess,
            endDateApp: endDateApp,
            startDateApp: startDateApp,
            description: description,
            ispin: ispin,
            // progressAp: progressAp,
            projectType: projectType)
        .then((value) async {
      try {
        context.pop('/');
        await getIt<PlannerController>()
            .uploadProjectImage(context,
                file: File(
                  getIt<PlannerController>().projectImage.value,
                ),
                id: value)
            .then((value) async {
          await getIt<PlannerController>().functionFetchDataPlanner(context);
          getIt<PlannerController>().projectImage.value = '';
        });
      } catch (e) {
        debugPrint("-------- $e");
      }
    });
    isLoading(false);
  }

  ///Function Create Data Planner:
  final isLoadingUpdatePlan = false.obs;
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
    isLoadingUpdatePlan(true);
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
    isLoadingUpdatePlan(false);
  }

  final isLoadUpload = false.obs;
  Future uploadProjectImage(BuildContext context,
      {required File file, int? id}) async {
    isLoadUpload(true);
    try {
      await getIt<PlannerRepository>().uploadProject(image: file.path, id: id);
    } catch (e) {
      isLoadUpload(false);
      debugPrint("----Error Catch Block$e");
    } finally {
      isLoadUpload(false);
      // functionGetProfileData(context, isGoogle: false);
    }
  }

  functionSuccessCreateData(BuildContext context) async {
    debugPrint(
        '====testing 123 =====ID: ${getIt<PlannerController>().getIdProject.value}');
    debugPrint(
        '====testing 123 =====Image: ${getIt<PlannerController>().projectImage.value}');
    try {
      context.pop('/');
      await getIt<PlannerController>()
          .uploadProjectImage(context,
              file: File(
                getIt<PlannerController>().projectImage.value,
              ),
              id: getIt<PlannerController>().getIdProject.value)
          .then((value) async {
        await getIt<PlannerController>().functionFetchDataPlanner(context);
      });
    } catch (e) {
      debugPrint("-------- $e");
    }
  }

  functionSuccessUpdateData(BuildContext context) async {
    try {
      context.pop('/');
      await getIt<PlannerController>()
          .uploadProjectImage(context,
              file: File(
                getIt<PlannerController>().projectImage.value,
              ),
              id: getIt<PlannerController>().getIdProject.value)
          .then((value) async {
        await getIt<PlannerController>().functionFetchDataPlanner(context);
      });
    } catch (e) {
      debugPrint("-------- $e");
    }
  }

  functionClearDataForm() {
    projectName.value = '';
    projectCover.value = '';
    projectDisciption.value = '';
    projectMember.value = [];
    endDate.value = '';
    startDate.value = '';
    projectPriority.value = '';
  }
  /////////////////////////End///////////////////////////////////

  //////==============>>>Task Block<<<=================///////
  final loadingTask = false.obs;

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
    try {
      loadingTask(true);
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
    } catch (e) {
      debugPrint("=======$e");
      loadingTask(true);
    }
    loadingTask(false);
  }

  ///Function Fetch Data Task:
  final taskDataList = <TaskModel>[].obs;

  Future<List<TaskModel>> functionFetchDataTask(BuildContext context,
      {String? id}) async {
    loadingTask(true);
    await getIt<PlannerRepository>().getTaskData(context, id: id).then((value) {
      taskDataList.value = value;

      debugPrint("-----success get controller Planner ==$value}");
      update();
    });

    loadingTask(false);
    update();
    return taskDataList;
  }

  /////Delete Task/////

  Future<void> funcDeleteTask(BuildContext context,
      {required int id, Function? functionSuccess}) async {
    try {
      loadingTask(true);
      await getIt<PlannerRepository>()
          .deleteTaskData(context, functionSuccess: functionSuccess, taskId: id)
          .then((value) async {
        update();
        loadingTask(false);
      });
    } catch (e) {
      debugPrint("$e");
    } finally {
      loadingTask(false);
    }
  }

  functionSuccessCreateTask(BuildContext context, {String? id}) async {
    context.pop();
    try {
      taskNameController.value.clear();
      selectionDueDateTaskController.value.clear();
      startDate.value = '';
      endDate.value = '';
      descriptionTaskController.value.clear();
      priorityTaskController.value.clear();
      await getIt<PlannerController>()
          .functionFetchDataTask(context, id: id)
          .then((value) {});
    } catch (e) {
      debugPrint("----------$e");
    }
  }
  ///////////////////////////End//////////////////////////////

  // Future<void> uploadImage() async {
  //   final token = await LocalDataStorage.getCurrentUser();
  //   final dioBaseHelper = dio.DioBaseHelper(
  //       "https://pocketplaner.onrender.com/api/v1/",
  //       token: "Bearer $token");
  //   XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
  //   if (file != null) {
  //     debugPrint("file: ${file.path}");
  //     await dioBaseHelper
  //         .onRequestFormData(
  //           showBodyInput: true,
  //           isDebugOn: true,
  //           formData: {
  //             "image": await dio.MultipartFile.fromFile(file.path),
  //             "tag": "profile",
  //           },
  //           endPoint: "upload-image",
  //           isAuthorize: true,
  //         )
  //         .then((value) => {
  //               debugPrint("value$value"),
  //             })
  //         .onError((dio.ErrorModel error, stackTrace) => {
  //               debugPrint("Error Status code: ${error.statusCode}"),
  //             });
  //   }
  // }

  @override
  void onInit() {
    // functionTesting();
    timeKhmer.value = int.parse(DateFormat('kk').format(DateTime.now()));
    debugPrint("---------Testing Build Screen-------");
    if (timeKhmer.value <= 12) {
      messageByTime.value = '☀️ Good Morning!';
    } else if ((timeKhmer.value > 12) && (timeKhmer.value <= 16)) {
      messageByTime.value = '🌤️ Good Afternoon!';
    } else if ((timeKhmer.value > 16) && (timeKhmer.value < 20)) {
      messageByTime.value = '🌤️ Good Evening!';
    } else {
      messageByTime.value = '🌙 Good Night!';
    }

    // getIt<PlannerRepository>().getPlannerData();
    super.onInit();
  }
}
