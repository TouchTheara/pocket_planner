import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocket_planner/config/app_colors.dart';
import 'package:pocket_planner/module/planner/presentation/logic/planner_controller.dart';
import 'package:pocket_planner/widget/cuctom_textfield.dart';
import 'package:pocket_planner/widget/custom_button.dart';

import '../../widget/custom_list_member.dart';

class CreateTaskFrom extends StatelessWidget {
  const CreateTaskFrom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final plannerController = Get.put(PlannerController());
    final List<String> listImage = [
      'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80',
      'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      'https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80',
      'https://cdn.pixabay.com/photo/2015/01/08/18/29/entrepreneur-593358__340.jpg',
      'https://cdn.pixabay.com/photo/2015/01/08/18/29/entrepreneur-593358__340.jpg',
      'https://cdn.pixabay.com/photo/2015/01/08/18/29/entrepreneur-593358__340.jpg',
    ];
    return SingleChildScrollView(
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
                      controller: plannerController.taskNameController.value,
                      isValidate: !plannerController.taskNameValidator.value,
                      labelText: 'Task name',
                      hintText: 'Task name',
                      onChange: (value) {
                        if (value == "") {
                          plannerController.taskNameValidator.value = true;
                        } else {
                          plannerController.taskNameValidator.value = false;
                        }
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                      controller:
                          plannerController.descriptionTaskController.value,
                      isValidate:
                          !plannerController.descriptionTaskValidator.value,
                      labelText: 'Description',
                      hintText: 'Description',
                      onChange: (value) {
                        if (value == "") {
                          plannerController.descriptionTaskValidator.value =
                              true;
                        } else {
                          plannerController.descriptionTaskValidator.value =
                              false;
                        }
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    controller: plannerController.priorityTaskController.value,
                    isValidate: !plannerController.priorityTaskValidator.value,
                    suffixIcon: const Icon(Icons.keyboard_arrow_down),
                    labelText: 'Priority',
                    hintText: 'Priority',
                    onTap: () {
                      debugPrint("-----------Testing...");
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    controller:
                        plannerController.selectionDueDateTaskController.value,
                    isValidate:
                        !plannerController.selectionDueDateTaskValidator.value,
                    suffixIcon: const Icon(Icons.keyboard_arrow_down),
                    labelText: 'Selection Due Date',
                    hintText: 'Selection Due Date',
                    onTap: () {
                      debugPrint("-----------Testing...");
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
                    height: 40,
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
                      ontap: () {},
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
    );
  }
}
