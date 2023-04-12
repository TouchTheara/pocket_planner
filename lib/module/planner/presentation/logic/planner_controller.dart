import 'package:dio_base_helper/dio_base_helper.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import 'package:injectable/injectable.dart';
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

  // Rxn<DateTime> startDate = Rxn<DateTime>();
  // Rxn<DateTime> endDate = Rxn<DateTime>();

  final memberList = <Object>[].obs;
  final isLoading = false.obs;

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
      await getIt<PlannerController>()
          .functionFetchDataPlanner(context)
          .then((value) {
        functionClearDataForm();
      });
    } catch (e) {
      debugPrint("-------- $e");
    }
  }

  functionSuccessUpdateData(BuildContext context) async {
    try {
      context.pop('/');
      await getIt<PlannerController>()
          .functionFetchDataPlanner(context)
          .then((value) {});
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

  functionSuccessCreateTask(BuildContext context, {String? id}) async {
    try {
      taskNameController.value.clear();
      selectionDueDateTaskController.value.clear();
      startDate.value = '';
      endDate.value = '';
      descriptionTaskController.value.clear();
      priorityTaskController.value.clear();
      await getIt<PlannerController>()
          .functionFetchDataTask(context, id: id)
          .then((value) => context.pop());
    } catch (e) {
      debugPrint("----------$e");
    }
  }

  Future<void> uploadImage() async {
    final token = await LocalDataStorage.getCurrentUser();
    final dioBaseHelper = dio.DioBaseHelper(
        "https://pocketplaner.onrender.com/api/v1/",
        token: "Bearer $token");
    XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (file != null) {
      debugPrint("file: ${file.path}");
      await dioBaseHelper
          .onRequestFormData(
            showBodyInput: true,
            isDebugOn: true,
            formData: {
              "image": await dio.MultipartFile.fromFile(file.path),
              "tag": "profile",
            },
            endPoint: "upload-image",
            isAuthorize: true,
          )
          .then((value) => {
                debugPrint("value$value"),
              })
          .onError((dio.ErrorModel error, stackTrace) => {
                debugPrint("Error Status code: ${error.statusCode}"),
              });
    }
  }

  @override
  void onInit() {
    // functionTesting();

    // getIt<PlannerRepository>().getPlannerData();
    super.onInit();
  }
}
