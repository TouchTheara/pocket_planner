import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocket_planner/config/app_colors.dart';
import 'package:pocket_planner/widget/custom_list_member.dart';

Widget customCardTask(BuildContext context,
    {required Object object, bool isSelection = false}) {
  final List<String> listImage = [
    'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80',
    'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    'https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80',
    'https://cdn.pixabay.com/photo/2015/01/08/18/29/entrepreneur-593358__340.jpg',
    'https://cdn.pixabay.com/photo/2015/01/08/18/29/entrepreneur-593358__340.jpg',
    'https://cdn.pixabay.com/photo/2015/01/08/18/29/entrepreneur-593358__340.jpg',
  ];
  return Container(
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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            isSelection = !isSelection;
          },
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
                color: isSelection == false ? AppColors.btnColor : Colors.white,
                border: Border.all(
                    width: 1,
                    color: isSelection == false
                        ? Colors.transparent
                        : AppColors.primaryColor),
                borderRadius: BorderRadius.circular(3)),
            child: isSelection == false
                ? const Center(
                    child: Icon(
                    Icons.check,
                    size: 18,
                    color: Colors.white,
                  ))
                : Container(),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                width: Get.width * 0.5,
                child: const Text(
                  'Create project structure for flutter',
                  style: TextStyle(color: Colors.black, fontSize: 14),
                )),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                customListMember(context,
                    listImage: listImage, heightIF: 22, widthIF: 22),
                const Padding(
                  padding: EdgeInsets.only(left: 70),
                  child: Text(
                    "Last update 3 days ago",
                    style: TextStyle(color: Colors.grey, fontSize: 10),
                  ),
                )
              ],
            ),
          ],
        ),
        const Text(
          'Due 14 Fab',
          style: TextStyle(color: Colors.grey, fontSize: 14),
        ),
      ],
    ),
  );
}
