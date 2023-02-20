import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:pocket_planner/config/app_colors.dart';

import 'custom_list_member.dart';

Widget customCardPin(BuildContext context,
    {Function? ontap,
    String projectName = 'CIC App',
    String description =
        'Lorem ipsum dolor sit amet, consectetur sdfad ipiscing elit sdfhdsfll sdfs',
    List<String> listImageMember = const [
      'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80',
      'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      'https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80',
      'https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80',
    ],
    int totalGoal = 0,
    int completedGoal = 0,
    double percentage = 0.7}) {
  return InkWell(
    onTap: () {
      ontap?.call();
      // debugPrint("Testing.............");
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            projectName,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: Get.width,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(1, 0),
                    color: Colors.grey.shade200,
                    blurRadius: 2,
                    spreadRadius: 2),
              ],
            ),
            child: Row(
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    projectName,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  SizedBox(width: Get.width * 0.45, child: Text(description)),
                  const SizedBox(
                    height: 30,
                  ),
                  customListMember(context,
                      heightIF: 40,
                      widthIF: 40,
                      borderWidth: 3,
                      listImage: listImageMember,
                      radiusImage: 10)
                ]),
                Expanded(
                  child: CircularPercentIndicator(
                    radius: 65.0,
                    lineWidth: 14.0,
                    animation: true,
                    percent: percentage,
                    center: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "$completedGoal",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                              color: AppColors.secondColor),
                        ),
                        Text(
                          "Goal: $totalGoal",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16.0),
                        ),
                      ],
                    ),
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: AppColors.secondColor,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
