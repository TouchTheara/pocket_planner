import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PlannerController extends GetxController {
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

  final memberList = <Object>[].obs;
}
