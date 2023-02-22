import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pocket_planner/config/app_colors.dart';
import 'package:pocket_planner/module/bottom_nav_bar/custom_drawer.dart';

import '../../../../util/form_builder/create_project_form.dart';
import '../../../../widget/custom_card_pin.dart';
import '../../../../widget/custom_card_project.dart';
import '../../../../widget/custom_modal_sheet.dart';
import '../../data/model/planner_model.dart';

class PlannerScreen extends StatelessWidget {
  const PlannerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    ScrollController? controller;
    return Material(
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        key: scaffoldKey,
        drawer: const CustomDrawer(),
        body: CustomScrollView(
          physics: const ClampingScrollPhysics(),
          controller: controller,
          slivers: <Widget>[
            SliverAppBar(
              floating: true,

              backgroundColor: AppColors.primaryColor,
              automaticallyImplyLeading: false,
              // expandedHeight: 80,

              centerTitle: false,
              title: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Good Morning",
                    style: TextStyle(color: Colors.white, fontSize: 14),
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
              actions: [
                IconButton(
                  onPressed: () {
                    customModelSheet(context,
                        child: CreateProjectFrom());
                  },
                  icon: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 28,
                  ),
                )
              ],
              leadingWidth: 100,
              leading: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      scaffoldKey.currentState!.openDrawer();
                    },
                    icon: const Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: 28,
                    ),
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
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                // color: const Color(0xff5c63f1),
                height: 20,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      height: 20,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              Container(
                color: const Color.fromRGBO(255, 255, 255, 1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 20, top: 0, bottom: 20),
                      child: Text(
                        "Active Planning",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: SizedBox(
                          height: 310,
                          // color: Colors.transparent,
                          child: ListView(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            children: [
                              ...List.generate(10, (index) => index + 1)
                                  .toList()
                                  .map(
                                    (e) => Padding(
                                      padding: EdgeInsets.only(
                                          right: 12, left: e > 1 ? 0 : 20),
                                      child: CustomCardProject(
                                        ontap: () {
                                          context.push('/detail',
                                              extra: PlannerModel());
                                        },
                                        plannerModel: PlannerModel(),
                                      ),
                                    ),
                                  )
                                  .toList()
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ])),
            //PIN OBJECTS
            SliverFixedExtentList(
              itemExtent: 330,
              delegate: SliverChildBuilderDelegate(
                childCount: 1,
                (BuildContext context, int index) {
                  return Column(
                    children: [
                      Expanded(
                        child: Container(
                            color: Colors.white,
                            child: customCardPin(context, ontap: () {
                              context.push('/detail', extra: PlannerModel());
                            })),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
