import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pocket_planner/config/app_colors.dart';
import 'package:pocket_planner/module/bottom_nav_bar/custom_drawer.dart';
import 'package:pocket_planner/module/planner/data/model/planner_model.dart';
import 'package:pocket_planner/widget/custom_card_pin.dart';
import 'package:pocket_planner/widget/custom_card_project.dart';

import '../../../../util/form_builder/create_project_form.dart';
import '../../../../widget/custom_modal_sheet.dart';

class PlannerScreen extends StatelessWidget {
  const PlannerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    ScrollController? controller;
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      key: scaffoldKey,
      drawer: const CustomDrawer(),
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          physics: const ClampingScrollPhysics(),
          controller: controller,
          slivers: <Widget>[
            SliverFillRemaining(
              hasScrollBody: false,
              fillOverscroll: true,
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            scaffoldKey.currentState!.openDrawer();
                          },
                          child: const Icon(
                            Icons.menu,
                            color: Colors.white,
                            size: 28,
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
                              image: const DecorationImage(
                                  image: NetworkImage(
                                      'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                                  fit: BoxFit.cover),
                              shape: BoxShape.circle),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Good Morning",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text('Theara',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            customModelSheet(context,
                                child: const CreateProjectFrom());
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
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              "Active Planning",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Container(
                              margin: const EdgeInsets.only(
                                  top: 10, bottom: 10, left: 20),
                              child: Row(
                                children: [
                                  CustomCardProject(
                                    ontap: () {
                                      context.push('/detail',
                                          extra: PlannerModel());
                                    },
                                    plannerModel: PlannerModel(),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  CustomCardProject(
                                    ontap: () {
                                      context.push('/detail',
                                          extra: PlannerModel());
                                    },
                                    plannerModel: PlannerModel(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Expanded(
                            child: customCardPin(context, ontap: () {
                              context.push('/detail', extra: PlannerModel());
                            }),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
