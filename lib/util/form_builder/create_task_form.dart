import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocket_planner/config/app_colors.dart';
import 'package:pocket_planner/core/service_locator/service_locator.dart';
import 'package:pocket_planner/module/planner/presentation/logic/planner_controller.dart';
import 'package:pocket_planner/widget/cuctom_textfield.dart';
import 'package:pocket_planner/widget/custom_button.dart';

import '../../widget/custom_popup_selection.dart';
import '../../widget/custom_list_member.dart';

class CreateTaskFrom extends StatelessWidget {
  const CreateTaskFrom({Key? key, this.id, this.isCreate = true})
      : super(key: key);

  final String? id;
  final bool isCreate;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    final List<String> listImage = [
      'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80',
      'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      'https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80',
      'https://cdn.pixabay.com/photo/2015/01/08/18/29/entrepreneur-593358__340.jpg',
      'https://cdn.pixabay.com/photo/2015/01/08/18/29/entrepreneur-593358__340.jpg',
      'https://cdn.pixabay.com/photo/2015/01/08/18/29/entrepreneur-593358__340.jpg',
    ];
    return Obx(
      () => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 8,
                width: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.grey.shade400),
              ),
              SizedBox(
                height: Get.height - 80,
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                          initialValue: getIt<PlannerController>()
                              .taskNameController
                              .value
                              .text,
                          controller: getIt<PlannerController>()
                              .taskNameController
                              .value,
                          isValidate: !getIt<PlannerController>()
                              .taskNameValidator
                              .value,
                          labelText: 'Task name',
                          hintText: 'Task name',
                          onChange: (value) {
                            getIt<PlannerController>()
                                .taskNameController
                                .value
                                .text = value;
                            getIt<PlannerController>()
                                    .taskNameController
                                    .value
                                    .selection =
                                TextSelection.fromPosition(TextPosition(
                                    offset: getIt<PlannerController>()
                                        .taskNameController
                                        .value
                                        .text
                                        .length));
                            if (value == "") {
                              getIt<PlannerController>()
                                  .taskNameValidator
                                  .value = true;
                            } else {
                              getIt<PlannerController>()
                                  .taskNameValidator
                                  .value = false;
                            }
                          }),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                          height: 100,
                          textAlignVertical: TextAlignVertical.top,
                          maxLine: null,
                          expands: true,
                          initialValue: getIt<PlannerController>()
                              .descriptionTaskController
                              .value
                              .text,
                          controller: getIt<PlannerController>()
                              .descriptionTaskController
                              .value,
                          isValidate: !getIt<PlannerController>()
                              .descriptionTaskValidator
                              .value,
                          labelText: 'Description',
                          hintText: 'Description',
                          onChange: (value) {
                            getIt<PlannerController>()
                                .descriptionTaskController
                                .value
                                .text = value;
                            getIt<PlannerController>()
                                    .descriptionTaskController
                                    .value
                                    .selection =
                                TextSelection.fromPosition(TextPosition(
                                    offset: getIt<PlannerController>()
                                        .descriptionTaskController
                                        .value
                                        .text
                                        .length));
                            if (value == "") {
                              getIt<PlannerController>()
                                  .descriptionTaskValidator
                                  .value = true;
                            } else {
                              getIt<PlannerController>()
                                  .descriptionTaskValidator
                                  .value = false;
                            }
                          }),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        initialValue: getIt<PlannerController>()
                            .priorityTaskController
                            .value
                            .text,
                        controller: getIt<PlannerController>()
                            .priorityTaskController
                            .value,
                        isValidate: !getIt<PlannerController>()
                            .priorityTaskValidator
                            .value,
                        suffixIcon: const Icon(Icons.keyboard_arrow_down),
                        labelText: '',
                        hintText: getIt<PlannerController>()
                                    .hintTextTaskPriority
                                    .value !=
                                ''
                            ? getIt<PlannerController>()
                                .hintTextTaskPriority
                                .value
                            : 'Priority',
                        onTap: () {
                          functionPopUpSelection(context,
                              percentHeight: 0.35,
                              title: 'Priority', ontapDone: (value1, value2) {
                            getIt<PlannerController>()
                                .priorityTaskController
                                .value
                                .text = value1;

                            // getIt<PlannerController>()
                            //     .hintTextTaskPriority
                            //     .value = value2;
                          });
                          debugPrint("-----------Testing...");
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        initialValue: getIt<PlannerController>()
                            .selectionDueDateTaskController
                            .value
                            .text,
                        controller: getIt<PlannerController>()
                            .selectionDueDateTaskController
                            .value,
                        isValidate: !getIt<PlannerController>()
                            .selectionDueDateTaskValidator
                            .value,
                        suffixIcon: const Icon(Icons.keyboard_arrow_down),
                        labelText: '',
                        hintText: getIt<PlannerController>()
                                    .hintTextTaskDueDate
                                    .value !=
                                ''
                            ? getIt<PlannerController>()
                                .hintTextTaskDueDate
                                .value
                            : 'Selection Due Date',
                        onTap: () {
                          debugPrint("-----------Testing...");
                          functionPopUpSelection(
                            context,
                            title: "Selection Due Date",
                            isCalender: true,
                            percentHeight: 0.38,
                            ontapDone: (value1, value2) {
                              getIt<PlannerController>()
                                  .selectionDueDateTaskController
                                  .value
                                  .text = "$value1 - $value2";
                              getIt<PlannerController>()
                                  .hintTextTaskDueDate
                                  .value = "$value1 - $value2";
                              getIt<PlannerController>().startDate.value =
                                  value1;
                              getIt<PlannerController>().startDate.value =
                                  value2;
                            },
                            // ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              margin: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      'https://t3.ftcdn.net/jpg/05/63/27/28/360_F_563272842_bWVQc2RgpUGKFycatKzjKp9niTGrekfj.jpg'),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Add projetct\ncover",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomButton(
                        height: 60,
                        width: Get.width * 0.5,
                        ontap: () {},
                        color: AppColors.secondColor,
                        borderColor: Colors.white,
                        borderWidth: 2,
                        isTitleOnly: false,
                        styleBTN: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              Icon(
                                Icons.groups_2,
                                color: Colors.white,
                                size: 30,
                              ),
                              Text(
                                "Invite Member",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      customListMember(context,
                          listImage: listImage, heightIF: 40, widthIF: 40),
                      const Spacer(),
                      SafeArea(
                        top: false,
                        minimum: const EdgeInsets.only(bottom: 10),
                        child: CustomButton(
                          height: 60,
                          ontap: () {
                            getIt<PlannerController>().functionCreateTask(
                                context,
                                title: getIt<PlannerController>()
                                    .taskNameController
                                    .value
                                    .text,
                                desciption: getIt<PlannerController>()
                                    .descriptionTaskController
                                    .value
                                    .text,
                                priority: getIt<PlannerController>()
                                    .priorityTaskController
                                    .value
                                    .text,
                                estimatetime: getIt<PlannerController>()
                                    .selectionDueDateTaskController
                                    .value
                                    .text, functionSuccess: () {
                              getIt<PlannerController>()
                                  .functionSuccessCreateTask(context, id: id);
                            });
                          },
                          color: AppColors.secondColor,
                          borderColor: Colors.white,
                          borderWidth: 2,
                          titleBTN: 'Create Task',
                          styleBTN: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
