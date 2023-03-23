import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:pocket_planner/config/app_colors.dart';
import 'package:pocket_planner/module/planner/data/model/form_data_model/form_data_model.dart';
import 'package:pocket_planner/module/planner/presentation/logic/planner_controller.dart';
import 'package:pocket_planner/widget/custom_button.dart';

import '../../core/service_locator/service_locator.dart';
import '../../widget/cuctom_textfield.dart';
import '../../widget/custom_popup_selection.dart';
import '../../widget/custom_list_member.dart';

class CreateProjectFrom extends StatelessWidget {
  const CreateProjectFrom({Key? key, required this.formDataModel})
      : super(key: key);

  final FormDataModel formDataModel;

  @override
  Widget build(BuildContext context) {
    debugPrint("--fff----${formDataModel.priority}");
    debugPrint("------${formDataModel.startDate}");
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    // final List<String> listImage = [
    //   'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80',
    //   'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    //   'https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80',
    //   'https://cdn.pixabay.com/photo/2015/01/08/18/29/entrepreneur-593358__340.jpg',
    //   'https://cdn.pixabay.com/photo/2015/01/08/18/29/entrepreneur-593358__340.jpg',
    //   'https://cdn.pixabay.com/photo/2015/01/08/18/29/entrepreneur-593358__340.jpg',
    // ];
    return Obx(
      () => Stack(
        children: [
          SingleChildScrollView(
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
                              initialValue: formDataModel.name,
                              isValidate: !getIt<PlannerController>()
                                  .projectNameValidator
                                  .value,
                              labelText: 'Project name',
                              hintText: 'Project name',
                              onChange: (value) {
                                formDataModel.name = value;
                                if (value == "") {
                                  getIt<PlannerController>()
                                      .projectNameValidator
                                      .value = true;
                                } else {
                                  getIt<PlannerController>()
                                      .projectNameValidator
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
                              initialValue: formDataModel.disciption,
                              isValidate: !getIt<PlannerController>()
                                  .descriptionValidator
                                  .value,
                              labelText: 'Description',
                              hintText: 'Description',
                              onChange: (value) {
                                formDataModel.disciption = value;
                                if (value == "") {
                                  getIt<PlannerController>()
                                      .descriptionValidator
                                      .value = true;
                                } else {
                                  getIt<PlannerController>()
                                      .descriptionValidator
                                      .value = false;
                                }
                              }),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextField(
                            // controller: getIt<PlannerController>()
                            //     .priorityController
                            //     .value,
                            initialValue: formDataModel.priority,
                            isValidate: !getIt<PlannerController>()
                                .priorityValidator
                                .value,
                            suffixIcon: const Icon(Icons.keyboard_arrow_down),
                            labelText: '',
                            hintText: formDataModel.priority != ''
                                ? formDataModel.priority
                                : 'Priority',
                            onTap: () {
                              functionPopUpSelection(
                                context,
                                percentHeight: 0.35,
                                title: "Priority",
                                ontapDone: (value1, value2) {
                                  formDataModel.priority = value1;
                                  // getIt<PlannerController>()
                                  //     .priorityController
                                  //     .value
                                  //     .text = value1;
                                  // getIt<PlannerController>()
                                  //     .hintTextProjectPriority
                                  //     .value = value2;
                                },
                                // ),
                              );
                              debugPrint("-----------Testing...");
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextField(
                            // controller: getIt<PlannerController>()
                            //     .selectionDueDateController
                            //     .value,
                            initialValue:
                                '${formDataModel.startDate} - ${formDataModel.endDate}',
                            isValidate: !getIt<PlannerController>()
                                .selectionDueDateValidator
                                .value,
                            suffixIcon: const Icon(Icons.keyboard_arrow_down),
                            labelText: '',
                            hintText: formDataModel.isCreate
                                ? 'Selection Due Date'
                                : '${formDataModel.startDate ?? ''} - ${formDataModel.endDate ?? ''}',
                            onTap: () {
                              debugPrint("-----------Testing...");
                              functionPopUpSelection(
                                context,
                                title: "Selection Due Date",
                                isCalender: true,
                                percentHeight: 0.38,
                                ontapDone: (value1, value2) {
                                  formDataModel.startDate = value1;
                                  formDataModel.endDate = value2;
                                  // getIt<PlannerController>()
                                  //     .selectionDueDateController
                                  //     .value
                                  //     .text = "$value1 - $value2";
                                  // getIt<PlannerController>()
                                  //     .hintTextProjectDueDate
                                  //     .value = "$value1 - $value2";
                                  // getIt<PlannerController>().startDate.value =
                                  //     value1;
                                  // getIt<PlannerController>().startDate.value =
                                  //     value2;
                                },
                                // ),
                              );
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          formDataModel.cover != ''
                              ? Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 18, vertical: 15),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            '${formDataModel.cover}')),
                                  ),
                                )
                              : Container(
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
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                              listImage: formDataModel.memberList ?? [],
                              heightIF: 40,
                              widthIF: 40),
                          const Spacer(),
                          SafeArea(
                            top: false,
                            minimum: const EdgeInsets.only(bottom: 10),
                            child: CustomButton(
                              height: 60,
                              ontap: () {
                                if (formDataModel.isCreate) {
                                  context.pop();
                                  getIt<PlannerController>()
                                      .functionCreatePlanner(context,
                                          title: getIt<PlannerController>()
                                              .projectNameController
                                              .value
                                              .text,
                                          description:
                                              getIt<PlannerController>()
                                                  .descriptionController
                                                  .value
                                                  .text,
                                          priorityApp:
                                              getIt<PlannerController>()
                                                  .priorityController
                                                  .value
                                                  .text,
                                          startDateApp:
                                              getIt<PlannerController>()
                                                  .startDate
                                                  .value,
                                          endDateApp: getIt<PlannerController>()
                                              .endDate
                                              .value, functionSuccess: () {
                                    getIt<PlannerController>()
                                        .functionSuccessCreateData(context);
                                  });
                                } else {
                                  debugPrint("-------Update");
                                  context.pop();
                                  getIt<PlannerController>()
                                      .functionUpdatePlanner(context,
                                          id: formDataModel.id!,
                                          title: formDataModel.name,
                                          description: formDataModel.disciption,
                                          priorityApp: formDataModel.priority,
                                          startDateApp: formDataModel.startDate,
                                          endDateApp: formDataModel.endDate,
                                          functionSuccess: () {
                                    getIt<PlannerController>()
                                        .functionSuccessUpdateData(context);
                                  });
                                }
                              },
                              color: AppColors.secondColor,
                              borderColor: Colors.white,
                              borderWidth: 2,
                              titleBTN: formDataModel.isCreate
                                  ? 'Create Project'
                                  : 'Update Project',
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
          // if (getIt<PlannerController>().isLoading.value) const CustomLoading()
        ],
      ),
    );
  }
}
