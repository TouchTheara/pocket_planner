import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:pocket_planner/config/app_colors.dart';
import 'package:pocket_planner/module/planner/data/model/planner_model.dart';

import '../../../../widget/custom_list_member.dart';

class CustomCardProject extends StatelessWidget {
  const CustomCardProject({Key? key, required this.plannerModel, this.ontap})
      : super(key: key);
  final PlannerModel plannerModel;
  final Function? ontap;

  @override
  Widget build(BuildContext context) {
    debugPrint("=======Debug Image project: ${plannerModel.imageUrl}");
    final List<String> listImage = [
      'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80',
      'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      'https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80',
      'https://cdn.pixabay.com/photo/2015/01/08/18/29/entrepreneur-593358__340.jpg',
      'https://cdn.pixabay.com/photo/2015/01/08/18/29/entrepreneur-593358__340.jpg',
      'https://cdn.pixabay.com/photo/2015/01/08/18/29/entrepreneur-593358__340.jpg',
    ];
    return InkWell(
      onTap: () {
        ontap!();
      },
      child: Container(
        margin: const EdgeInsets.all(3),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: const Offset(1, 0),
                color: Colors.grey.shade200,
                blurRadius: 10,
                spreadRadius: 2),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: Get.height * 0.22,
                  width: Get.width * 0.5,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: NetworkImage(
                            // plannerModel.imageUrl != '' &&
                            plannerModel.imageUrl != null
                                ? "${plannerModel.imageUrl}"
                                : 'https://img.freepik.com/free-photo/rpa-concept-with-blurry-hand-touching-screen_23-2149311914.jpg'),
                        fit: BoxFit.cover),
                  ),
                ),
                Positioned(
                    bottom: 10,
                    left: 10,
                    child: customListMember(context, listImage: listImage))
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              plannerModel.titleApp != ''
                  ? '${plannerModel.titleApp}'
                  : "No Title",
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              "Mobile | Web",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 11,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            progressApp(context, percent: 0.7, data: plannerModel),
          ],
        ),
      ),
    );
  }
}

Widget progressApp(BuildContext context,
    {double percent = 1.0, PlannerModel? data}) {
  return SizedBox(
    width: Get.width * 0.5,
    child: Column(
      children: [
        Row(
          children: [
            const Text(
              "Due",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 11,
                fontWeight: FontWeight.normal,
              ),
            ),
            const Spacer(),
            Text(
              "${data!.endDateApp}",
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 11,
                fontWeight: FontWeight.normal,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        LinearPercentIndicator(
          padding: EdgeInsets.zero,
          animation: true,
          lineHeight: 3.0,
          animationDuration: 2000,
          percent: percent,
          barRadius: const Radius.circular(10),
          progressColor: AppColors.secondColor,
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            const Text(
              "Progress",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 11,
                fontWeight: FontWeight.normal,
              ),
            ),
            const Spacer(),
            Text(
              "${(percent * 100).toInt()}%",
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 11,
                fontWeight: FontWeight.normal,
              ),
            )
          ],
        ),
      ],
    ),
  );
}
