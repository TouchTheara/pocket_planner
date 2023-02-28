import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pocket_planner/config/app_colors.dart';
import 'package:pocket_planner/core/auth/presentation/logic/auth_controller.dart';
import 'package:pocket_planner/module/planner/presentation/logic/planner_controller.dart';

import '../../core/service_locator/service_locator.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key, this.child}) : super(key: key);
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: InkWell(
                onTap: () {
                  context.push('/profile');
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 1, color: Colors.grey)),
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const CircleAvatar(
                        radius: 30,
                        backgroundColor: AppColors.primaryColor,
                        backgroundImage: NetworkImage(
                            'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Theara Touch',
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'dev.theara@gmail.com',
                          ),
                        ],
                      ),
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
                      onTap: () {},
                      leading: const Icon(Icons.feed),
                      title: const Text("Feeds"),
                      // Some Code
                    ),
                    ListTile(
                      onTap: () {
                        getIt<PlannerController>().functionFetchDataPlanner();
                        context.pop();
                      },
                      leading: const Icon(Icons.home),
                      title: const Text("Home"),
                      // Some Code
                    ),
                    ListTile(
                      onTap: () {},
                      leading: const Icon(Icons.card_travel),
                      title: const Text("Meeting"),
                      // Some Code
                    ),
                    ListTile(
                      onTap: () {},
                      leading: const Icon(Icons.notification_add),
                      title: const Text("Notification"),
                      // Some Code
                    ),
                    ListTile(
                      onTap: () {},
                      leading: const Icon(Icons.sunny),
                      title: const Text("Light Mode"),
                      // Some Code
                    ),
                    ListTile(
                      onTap: () {},
                      leading: const Icon(Icons.language),
                      title: const Text("Language"),
                      // Some Code
                    ),
                    ListTile(
                      onTap: () {
                        context.push('/setting');
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
