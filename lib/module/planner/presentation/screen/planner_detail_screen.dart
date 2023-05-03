import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:pocket_planner/config/app_colors.dart';
import 'package:pocket_planner/module/planner/data/model/planner_model.dart';
import 'package:pocket_planner/module/planner/presentation/logic/planner_controller.dart';
import 'package:pocket_planner/widget/custom_button.dart';
import 'package:pocket_planner/widget/custom_list_member.dart';

import '../../../../core/service_locator/service_locator.dart';
import '../../../../util/form_builder/create_task_form.dart';
import '../../../../widget/custom_alert_popup.dart';

import '../../../../widget/custom_modal_sheet.dart';
import '../widget/custom_card_task.dart';

class PlannerDetailScreen extends StatelessWidget {
  final PlannerModel plannerModel;

  const PlannerDetailScreen({Key? key, required this.plannerModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController? controller;
    final List<String> listImage = [
      'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80',
      'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      'https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80',
      'https://cdn.pixabay.com/photo/2015/01/08/18/29/entrepreneur-593358__340.jpg',
      'https://cdn.pixabay.com/photo/2015/01/08/18/29/entrepreneur-593358__340.jpg',
      'https://cdn.pixabay.com/photo/2015/01/08/18/29/entrepreneur-593358__340.jpg',
    ];
    // final List<Widget> listTask = [
    //   Container(),
    //   Container(),
    //   Container(),
    // ];
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Obx(
        () => CustomScrollView(
          controller: controller,
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.grey.shade100,
              leading: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: InkWell(
                  borderRadius: BorderRadius.circular(30),
                  onTap: () {
                    context.pop();
                  },
                  child: Platform.isIOS
                      ? Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.shade400.withOpacity(0.6),
                              shape: BoxShape.circle),
                          child: const Padding(
                            padding: EdgeInsets.only(left: 6),
                            child: Icon(
                              Icons.arrow_back_ios,
                              size: 22,
                            ),
                          ))
                      : Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey.shade400.withOpacity(0.6),
                          ),
                          child: const Icon(
                            Icons.arrow_back,
                            size: 22,
                          )),
                ),
              ),
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(30),
                    onTap: () {
                      getIt<PlannerController>().projectName.value =
                          plannerModel.titleApp ?? '';
                      getIt<PlannerController>().projectDisciption.value =
                          plannerModel.description ?? '';
                      getIt<PlannerController>().projectPriority.value =
                          plannerModel.priorityApp ?? '';
                      getIt<PlannerController>().startDate.value =
                          plannerModel.startDateApp ?? '';
                      getIt<PlannerController>().endDate.value =
                          plannerModel.endDateApp ?? '';
                      getIt<PlannerController>().projectCover.value =
                          plannerModel.imageApp ?? '';
                      getIt<PlannerController>().projectId.value =
                          int.parse(plannerModel.idApp ?? '');

                      openAlertBox(
                        context,
                      );
                      debugPrint("------->>>><<<<< ID : ${plannerModel.idApp}");
                    },
                    child: Container(
                        padding: const EdgeInsets.all(11),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade400.withOpacity(0.6),
                            shape: BoxShape.circle),
                        child: const Icon(
                          Icons.more_vert,
                          size: 22,
                        )),
                  ),
                )
              ],
              pinned: false,
              snap: false,
              floating: true,
              expandedHeight: Get.height * 0.24,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text(''),
                background: Image.network(
                  plannerModel.imageApp != '' && plannerModel.imageApp != null
                      ? "${plannerModel.imageApp}"
                      : 'https://img.freepik.com/free-photo/rpa-concept-with-blurry-hand-touching-screen_23-2149311914.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          plannerModel.titleApp != '' &&
                                  plannerModel.titleApp != null
                              ? "${plannerModel.titleApp}"
                              : "No Title",
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.calendar_today,
                              size: 20,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(plannerModel.endDateApp != '' &&
                                    plannerModel.endDateApp != null
                                ? "${plannerModel.endDateApp}"
                                : "No Due"),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      plannerModel.projectType != '' &&
                              plannerModel.projectType != null
                          ? "${plannerModel.projectType}"
                          : "No Type",
                      style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.normal),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    customListMember(context,
                        listImage: listImage, heightIF: 40, widthIF: 40),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Description",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      plannerModel.description != '' &&
                              plannerModel.description != null
                          ? "${plannerModel.description}"
                          : "No Description",
                      style: const TextStyle(
                          wordSpacing: 1.8,
                          height: 1.4,
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.normal),
                      textAlign: TextAlign.justify,
                      maxLines: 8,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Tasks",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    getIt<PlannerController>().taskDataList.isEmpty
                        ? const Text("No Task Yet")
                        : SingleChildScrollView(
                            child: Column(
                              children: getIt<PlannerController>()
                                  .taskDataList
                                  .map((e) => Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 12),
                                        child: customCardTask(context,
                                            object: Object()),
                                      ))
                                  .toList(),
                            ),
                          ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Spacer(),
                    SafeArea(
                      top: false,
                      bottom: false,
                      minimum: const EdgeInsets.only(bottom: 10),
                      child: CustomButton(
                        ontap: () {
                          customModelSheet(context,
                              child: CreateTaskFrom(
                                id: plannerModel.idApp,
                              ));
                        },
                        titleBTN: 'Create Task',
                        styleBTN: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                        color: AppColors.primaryColor,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
