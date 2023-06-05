import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:pocket_planner/config/app_colors.dart';
import 'package:pocket_planner/core/auth/presentation/logic/auth_controller.dart';
import 'package:pocket_planner/module/planner/presentation/logic/planner_controller.dart';
import 'package:pocket_planner/module/profile/presentation/logic/profile_controller.dart';

import '../../core/service_locator/service_locator.dart';
import '../../widget/custom_feature_underdevelop.dart';
import '../../widget/custom_showbottomsheet.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key, this.child}) : super(key: key);
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Drawer(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: InkWell(
                onTap: () {
                  getIt<PlannerController>()
                      .advancedDrawerController
                      .hideDrawer();

                  context.push('/profile');
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 1, color: Colors.grey)),
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: AppColors.primaryColor,
                        backgroundImage: NetworkImage(
                            '${getIt<ProfileController>().profileData.value.imageUrl}'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${getIt<ProfileController>().profileData.value.firstName?.toUpperCase()} ${getIt<ProfileController>().profileData.value.lastName?.toUpperCase()}',
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              '${getIt<ProfileController>().profileData.value.userName}',
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      const Icon(Icons.keyboard_arrow_down)
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    ListTile(
                      onTap: () async {
                        getIt<PlannerController>()
                            .advancedDrawerController
                            .hideDrawer();
                        await onShowBottomSheet(
                            isNoAppBar: true,
                            backgroundColor: Colors.transparent,
                            context: context,
                            child: const CustomPopupbuttonSheet(
                              assetImage:
                                  'assets/images/svgFile/underDevelopment.svg',
                              description:
                                  'This feature is under development at the moment',
                              title: 'This feature not available yet',
                            ),
                            onDismissed: () {
                              debugPrint("-----------------Testt dismiss");
                              context.pop();
                            });
                      },
                      leading: const Icon(Icons.feed),
                      title: const Text("Feeds"),
                      // Some Code
                    ),
                    // ListTile(
                    //   onTap: () async {
                    //     getIt<PlannerController>()
                    //         .functionFetchDataPlanner(context);
                    //   },
                    //   leading: const Icon(Icons.home),
                    //   title: const Text("Home"),
                    //   // Some Code
                    // ),
                    ListTile(
                      onTap: () {
                        getIt<PlannerController>()
                            .advancedDrawerController
                            .hideDrawer();
                        context.push('/meeting');
                      },
                      leading: const Icon(Icons.card_travel),
                      title: const Text("Meeting"),
                      // Some Code
                    ),
                    ListTile(
                      onTap: () async {
                        getIt<PlannerController>()
                            .advancedDrawerController
                            .hideDrawer();
                        await onShowBottomSheet(
                            isNoAppBar: true,
                            backgroundColor: Colors.transparent,
                            context: context,
                            child: const CustomPopupbuttonSheet(
                              assetImage:
                                  'assets/images/svgFile/underDevelopment.svg',
                              description:
                                  'This feature is under development at the moment',
                              title: 'This feature not available yet',
                            ),
                            onDismissed: () {
                              debugPrint("-----------------Testt dismiss");
                              context.pop();
                            });
                        // context.push('/notification');
                      },
                      leading: const Icon(Icons.notification_add),
                      title: const Text("Notification"),
                      // Some Code
                    ),
                    ListTile(
                      onTap: () {
                        getIt<PlannerController>()
                            .advancedDrawerController
                            .hideDrawer();
                        getIt<PlannerController>().darkmode.value =
                            !getIt<PlannerController>().darkmode.value;
                      },
                      leading: !getIt<PlannerController>().darkmode.value
                          ? const Icon(Icons.dark_mode)
                          : const Icon(Icons.sunny),
                      title: Text(!getIt<PlannerController>().darkmode.value
                          ? "Dark Mode"
                          : "Light Mode"),
                      // Some Code
                    ),
                    ListTile(
                      onTap: () async {
                        getIt<PlannerController>()
                            .advancedDrawerController
                            .hideDrawer();
                        await onShowBottomSheet(
                            isNoAppBar: true,
                            backgroundColor: Colors.transparent,
                            context: context,
                            child: const CustomPopupbuttonSheet(
                              assetImage:
                                  'assets/images/svgFile/underDevelopment.svg',
                              description:
                                  'This feature is under development at the moment',
                              title: 'This feature not available yet',
                            ),
                            onDismissed: () {
                              debugPrint("-----------------Testt dismiss");
                              context.pop();
                            });
                      },
                      leading: const Icon(Icons.language),
                      title: const Text("Language"),
                      // Some Code
                    ),
                    ListTile(
                      onTap: () async {
                        getIt<PlannerController>()
                            .advancedDrawerController
                            .hideDrawer();
                        await onShowBottomSheet(
                            isNoAppBar: true,
                            backgroundColor: Colors.transparent,
                            context: context,
                            child: const CustomPopupbuttonSheet(
                              assetImage:
                                  'assets/images/svgFile/underDevelopment.svg',
                              description:
                                  'This feature is under development at the moment',
                              title: 'This feature not available yet',
                            ),
                            onDismissed: () {
                              debugPrint("-----------------Testt dismiss");
                              context.pop();
                            });
                        // context.push('/setting');
                      },
                      leading: const Icon(Icons.settings),
                      title: const Text("Setting"),
                      // Some Code
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: ListTile(
                onTap: () async {
                  getIt<AuthController>().functionClearToken(context);
                },
                leading: const Icon(Icons.arrow_back),
                title: const Text("Sign Out"),
                // Some Code
              ),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
