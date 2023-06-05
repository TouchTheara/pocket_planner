import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocket_planner/config/app_colors.dart';
import 'package:pocket_planner/module/planner/presentation/logic/planner_controller.dart';
import 'package:pocket_planner/widget/custom_button.dart';

import '../../core/service_locator/service_locator.dart';
import '../../module/planner/presentation/screen/invite_member_screen.dart';
import '../../widget/change_profile_photo.dart';
import '../../widget/cuctom_textfield.dart';
import '../../widget/custom_modal_sheet.dart';
import '../../widget/custom_popup_selection.dart';
import '../../widget/custom_list_member.dart';
import '../file_handler/file_controller.dart';

class CreateProjectFrom extends StatelessWidget {
  const CreateProjectFrom({Key? key, this.isCreate = false}) : super(key: key);

  final bool isCreate;

  @override
  Widget build(BuildContext context) {
    debugPrint(
        "&&&&&&&&&&&&&&${getIt<PlannerController>().projectImage.value}");
    return Obx(() => Scaffold(
          appBar: AppBar(
            title: Text(isCreate ? "Create Project" : "Update Project"),
          ),
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: Get.height - 80,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            CustomTextField(
                                initialValue: getIt<PlannerController>()
                                    .projectName
                                    .value,
                                // getIt<PlannerController>(): getIt<PlannerController>()
                                //     .prioritygetIt<PlannerController>()
                                //     .value,
                                isValidate: !getIt<PlannerController>()
                                    .projectNameValidator
                                    .value,
                                labelText: 'Project name',
                                hintText: 'Project name',
                                onChange: (value) {
                                  getIt<PlannerController>().projectName.value =
                                      value;
                                  if (value == "") {
                                    getIt<PlannerController>()
                                        .projectNameValidator
                                        .value = true;
                                  } else {
                                    getIt<PlannerController>()
                                        .projectNameValidator
                                        .value = false;
                                  }
                                  getIt<PlannerController>().update();
                                }),
                            const SizedBox(height: 10),
                            CustomTextField(
                                height: 100,
                                textAlignVertical: TextAlignVertical.top,
                                maxLine: null,
                                expands: true,
                                initialValue: getIt<PlannerController>()
                                    .projectDisciption
                                    .value,
                                isValidate: !getIt<PlannerController>()
                                    .descriptionValidator
                                    .value,
                                labelText: 'Description',
                                hintText: 'Description',
                                onChange: (value) {
                                  getIt<PlannerController>()
                                      .projectDisciption
                                      .value = value;
                                  if (value == "") {
                                    getIt<PlannerController>()
                                        .descriptionValidator
                                        .value = true;
                                  } else {
                                    getIt<PlannerController>()
                                        .descriptionValidator
                                        .value = false;
                                  }
                                  getIt<PlannerController>().update();
                                }),
                            const SizedBox(height: 10),
                            CustomTextField(
                              initialValue: getIt<PlannerController>()
                                  .projectPriority
                                  .value,
                              isValidate: !getIt<PlannerController>()
                                  .priorityValidator
                                  .value,
                              suffixIcon: const Icon(Icons.keyboard_arrow_down),
                              labelText: '',
                              hintText: getIt<PlannerController>()
                                          .projectPriority
                                          .value !=
                                      ''
                                  ? getIt<PlannerController>()
                                      .projectPriority
                                      .value
                                  : 'Priority',
                              onTap: () {
                                functionPopUpSelection(
                                  context,
                                  percentHeight: 0.35,
                                  title: "Priority",
                                  ontapDone: (value1, value2) {
                                    getIt<PlannerController>()
                                        .projectPriority
                                        .value = value1;
                                  },
                                  // ),
                                );
                                debugPrint("-----------Testing...");
                              },
                            ),
                            const SizedBox(height: 10),
                            CustomTextField(
                              initialValue: getIt<PlannerController>()
                                              .startDate
                                              .value ==
                                          '' &&
                                      getIt<PlannerController>()
                                              .endDate
                                              .value ==
                                          ''
                                  ? ''
                                  : '${getIt<PlannerController>().startDate.value} - ${getIt<PlannerController>().endDate.value}',
                              isValidate: !getIt<PlannerController>()
                                  .selectionDueDateValidator
                                  .value,
                              suffixIcon: const Icon(Icons.keyboard_arrow_down),
                              labelText: '',
                              hintText: isCreate
                                  ? 'Selection Due Date'
                                  : '${getIt<PlannerController>().startDate.value} - ${getIt<PlannerController>().endDate.value}',
                              onTap: () {
                                debugPrint("-----------Testing...");
                                functionPopUpSelection(
                                  context,
                                  title: "Selection Due Date",
                                  isCalender: true,
                                  percentHeight: 0.38,
                                  ontapDone: (value1, value2) {
                                    getIt<PlannerController>().startDate.value =
                                        value1;
                                    getIt<PlannerController>().endDate.value =
                                        value2;
                                  },
                                  // ),
                                );
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            getIt<PlannerController>().projectImage.value != ''
                                ? GestureDetector(
                                    onTap: () {
                                      funcChangeProfilePhoto(context,
                                          ontapTakePhoto: () async {
                                        await getIt<FileController>()
                                            .funcAssignTakePhotoFile(
                                          context,
                                        )
                                            .then((value) async {
                                          getIt<PlannerController>()
                                              .projectImage
                                              .value = value.path;
                                          // await getIt<ProfileController>()
                                          //     .uploadProfileImage(context,
                                          //         file: File(value.path));
                                        });
                                      }, ontapChoosePhoto: () async {
                                        await getIt<FileController>()
                                            .funcAssignChoosePhotoFile(
                                          context,
                                        )
                                            .then((value) async {
                                          getIt<PlannerController>()
                                              .projectImage
                                              .value = value.path;
                                          // getIt<ProfileController>().profileImage =
                                          //     File(value.path);
                                          // await getIt<ProfileController>().uploadProfileImage(
                                          //     context,
                                          //     file: File(value.path));
                                        });
                                      });
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: getIt<PlannerController>()
                                                      .projectImage
                                                      .value !=
                                                  ''
                                              ? 5
                                              : 18,
                                          vertical: getIt<PlannerController>()
                                                      .projectImage
                                                      .value !=
                                                  ''
                                              ? 5
                                              : 15),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.file(
                                          File(getIt<PlannerController>()
                                              .projectImage
                                              .value),
                                          height: 110,
                                          width: 110,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  )
                                : InkWell(
                                    onTap: () {
                                      funcChangeProfilePhoto(context,
                                          ontapTakePhoto: () async {
                                        await getIt<FileController>()
                                            .funcAssignTakePhotoFile(
                                          context,
                                        )
                                            .then((value) async {
                                          Future.delayed(
                                              const Duration(seconds: 1), () {
                                            getIt<PlannerController>()
                                                .projectImage
                                                .value = value.path;
                                          });

                                          // await getIt<ProfileController>()
                                          //     .uploadProfileImage(context,
                                          //         file: File(value.path));
                                        });
                                      }, ontapChoosePhoto: () async {
                                        await getIt<FileController>()
                                            .funcAssignChoosePhotoFile(
                                          context,
                                        )
                                            .then((value) async {
                                          Future.delayed(
                                              const Duration(seconds: 1), () {
                                            getIt<PlannerController>()
                                                .projectImage
                                                .value = value.path;
                                          });
                                          // getIt<ProfileController>().profileImage =
                                          //     File(value.path);
                                          // await getIt<ProfileController>().uploadProfileImage(
                                          //     context,
                                          //     file: File(value.path));
                                        });
                                      });
                                    },
                                    child: Container(
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
                                            "Add project\ncover",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.grey,
                                                height: 1.2),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomButton(
                              height: 60,
                              width: Get.width * 0.5,
                              ontap: () {
                                customModelSheet(context,
                                    child: const InviteMemberScreen());
                              },
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
                                listImage:
                                    getIt<PlannerController>().projectMember,
                                heightIF: 40,
                                widthIF: 40),
                            const Spacer(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // if (getIt<PlannerController>().isLoading.value) const CustomLoading()
            ],
          ),
          bottomNavigationBar: SafeArea(
            top: false,
            minimum: const EdgeInsets.only(bottom: 10, left: 20, right: 20),
            child: CustomButton(
              height: 60,
              ontap: () {
                if (isCreate) {
                  // context.pop();
                  getIt<PlannerController>().functionCreatePlanner(context,
                      title: getIt<PlannerController>().projectName.value,
                      description:
                          getIt<PlannerController>().projectDisciption.value,
                      priorityApp:
                          getIt<PlannerController>().projectPriority.value,
                      startDateApp: getIt<PlannerController>().startDate.value,
                      endDateApp: getIt<PlannerController>().endDate.value,
                      functionSuccess: () async {
                    // await getIt<PlannerController>()
                    //     .functionSuccessCreateData(context);
                  });
                } else {
                  debugPrint("-------Update");
                  // context.pop();
                  getIt<PlannerController>().functionUpdatePlanner(context,
                      id: getIt<PlannerController>().projectId.value,
                      title: getIt<PlannerController>().projectName.value,
                      description:
                          getIt<PlannerController>().projectDisciption.value,
                      priorityApp:
                          getIt<PlannerController>().projectPriority.value,
                      startDateApp: getIt<PlannerController>().startDate.value,
                      endDateApp: getIt<PlannerController>().endDate.value,
                      functionSuccess: () {
                    getIt<PlannerController>()
                        .functionSuccessUpdateData(context);
                  });
                }
                getIt<PlannerController>().update();
              },
              color: AppColors.secondColor,
              borderColor: Colors.white,
              borderWidth: 2,
              titleBTN: isCreate ? 'Create Project' : 'Update Project',
              styleBTN: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ));
  }
}
