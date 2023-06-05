import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import 'package:pocket_planner/config/app_colors.dart';
import 'package:pocket_planner/core/auth/presentation/logic/auth_controller.dart';
import 'package:pocket_planner/core/service_locator/service_locator.dart';
import 'package:pocket_planner/module/bottom_nav_bar/custom_drawer.dart';
import 'package:pocket_planner/module/planner/presentation/logic/planner_controller.dart';
import 'package:pocket_planner/module/profile/presentation/logic/profile_controller.dart';
import 'package:pocket_planner/widget/custom_loading.dart';

import '../widget/custom_card_pin.dart';
import '../widget/custom_card_project.dart';

class PlannerScreen extends StatelessWidget {
  const PlannerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final con = Get.find<MainController>();

    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    ScrollController? controller;
    void handleMenuButtonPressed() {
      getIt<PlannerController>().advancedDrawerController.showDrawer();
    }

    return GetBuilder(
        dispose: (state) {},
        init: getIt<PlannerController>(),
        initState: (state) async {
          await getIt<PlannerController>()
              .functionFetchDataPlanner(context)
              .then((value) async {
            await getIt<ProfileController>()
                .functionGetProfileData(context)
                .then((value) {});
          });
        },
        builder: (plcontroller) {
          return Stack(
            children: [
              AdvancedDrawer(
                drawer: const CustomDrawer(),
                backdropColor: Colors.white,
                controller: getIt<PlannerController>().advancedDrawerController,
                animationCurve: Curves.linearToEaseOut,
                animationDuration: const Duration(milliseconds: 300),
                animateChildDecoration: true,
                rtlOpening: false,
                disabledGestures: false,
                childDecoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                child: Scaffold(
                  backgroundColor: AppColors.primaryColor,
                  key: scaffoldKey,
                  body: Obx(
                    () => Center(
                      child: SafeArea(
                          bottom: false,
                          child: CustomScrollView(
                            physics: const ClampingScrollPhysics(),
                            controller: controller,
                            slivers: <Widget>[
                              SliverFillRemaining(
                                hasScrollBody: false,
                                // fillOverscroll: true,
                                child: Column(children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: SizedBox(
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          IconButton(
                                            onPressed: handleMenuButtonPressed,
                                            icon: ValueListenableBuilder<
                                                AdvancedDrawerValue>(
                                              valueListenable:
                                                  getIt<PlannerController>()
                                                      .advancedDrawerController,
                                              builder: (_, value, __) {
                                                return AnimatedSwitcher(
                                                  duration: const Duration(
                                                      milliseconds: 250),
                                                  child: Icon(
                                                    // value.visible
                                                    //     ? Icons.clear
                                                    // :
                                                    Icons.menu,
                                                    color: Colors.white,
                                                    key: ValueKey<bool>(
                                                        value.visible),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            padding: const EdgeInsets.all(22),
                                            decoration: BoxDecoration(
                                                color: Colors.grey,
                                                border: Border.all(
                                                  color: Colors.white,
                                                  width: 2.5,
                                                ),
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        "${getIt<ProfileController>().profileData.value.imageUrl}"),
                                                    fit: BoxFit.cover),
                                                shape: BoxShape.circle),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                getIt<PlannerController>()
                                                    .messageByTime
                                                    .value,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              if (getIt<ProfileController>()
                                                          .profileData
                                                          .value
                                                          .firstName !=
                                                      null ||
                                                  getIt<ProfileController>()
                                                          .profileData
                                                          .value
                                                          .lastName !=
                                                      null)
                                                Text(
                                                    '${getIt<ProfileController>().profileData.value.firstName?.toUpperCase()} ${getIt<ProfileController>().profileData.value.lastName?.toUpperCase()}',
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold))
                                            ],
                                          ),
                                          const Spacer(),
                                          InkWell(
                                            radius: 20,
                                            splashColor: Colors.transparent,
                                            onTap: () async {
                                              getIt<PlannerController>()
                                                  .functionClearDataForm();
                                              context
                                                  .push('/create-project/true');
                                              getIt<PlannerController>()
                                                  .update();
                                            },
                                            child: const Icon(
                                              Icons.add,
                                              color: Colors.white,
                                              size: 28,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Expanded(
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20, bottom: 20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            if (getIt<PlannerController>()
                                                .plannerDataList
                                                .isNotEmpty)
                                              const Padding(
                                                padding:
                                                    EdgeInsets.only(left: 20),
                                                child: Text(
                                                  "Active Planning",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Container(
                                                margin: const EdgeInsets.only(
                                                    top: 10,
                                                    bottom: 10,
                                                    left: 20),
                                                child: Row(
                                                  children: [
                                                    ...getIt<
                                                            PlannerController>()
                                                        .plannerDataList
                                                        .asMap()
                                                        .entries
                                                        .map(
                                                          (data) =>
                                                              CustomCardProject(
                                                            ontap: () {
                                                              debugPrint(
                                                                  "=======ID========: ${data.value.idApp}");
                                                              context.push(
                                                                  '/detail',
                                                                  extra: data
                                                                      .value);
                                                              getIt<PlannerController>()
                                                                  .functionFetchDataTask(
                                                                      context,
                                                                      id: data
                                                                          .value
                                                                          .idApp);
                                                              debugPrint(
                                                                  "-----Hello");
                                                            },
                                                            plannerModel:
                                                                data.value,
                                                          ),
                                                        )
                                                        .toList()
                                                        .reversed
                                                    // CustomCardProject(
                                                    //   ontap: () {
                                                    //     Navigator.push(
                                                    //         context,
                                                    //         MaterialPageRoute(
                                                    //             builder: (context) =>
                                                    //                 PlannerDetailScreen(
                                                    //                   plannerModel:
                                                    //                       PlannerModel(),
                                                    //                 )));
                                                    //     // context.push('/detail',
                                                    //     // extra: PlannerModel());
                                                    //   },
                                                    //   plannerModel: PlannerModel(),
                                                    // ),
                                                    // const SizedBox(
                                                    //   width: 20,
                                                    // ),
                                                    // CustomCardProject(
                                                    //   ontap: () {
                                                    //     context.push('/detail',
                                                    //         extra: PlannerModel());
                                                    //   },
                                                    //   plannerModel: PlannerModel(),
                                                    // ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Expanded(
                                              child: Column(
                                                children: [
                                                  ...getIt<PlannerController>()
                                                      .plannerDataList
                                                      .asMap()
                                                      .entries
                                                      .map((data) {
                                                    if (data.value.ispin ==
                                                        true) {
                                                      return customCardPin(
                                                          context,
                                                          plannerModel:
                                                              data.value,
                                                          ontap: () {
                                                        context.push('/detail',
                                                            extra: data.value);
                                                        getIt<PlannerController>()
                                                            .functionFetchDataTask(
                                                                context,
                                                                id: data.value
                                                                    .idApp);
                                                      });
                                                    }
                                                    return Container();
                                                  }).toList(),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ]),
                              )
                            ],
                          )),
                    ),
                  ),
                ),
              ),
              if (getIt<PlannerController>().isLoading.value ||
                  getIt<PlannerController>().isLoadingUpdatePlan.value ||
                  getIt<PlannerController>().isLoadUpload.value ||
                  getIt<AuthController>().isLoading.value)
                const CustomLoading()
            ],
          );
        });
  }
}
