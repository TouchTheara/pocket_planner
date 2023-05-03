import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pocket_planner/config/app_colors.dart';

class CustomLoading extends StatelessWidget {
  final String? title;
  const CustomLoading({Key? key, this.title = ''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LoadingAnimationWidget.threeArchedCircle(
            color: AppColors.primaryColor,
            size: 50,
          ),
          const SizedBox(height: 30),
          if (title != '')
            Text('$title',
                style: const TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                )),
        ],
      ),
    );
  }
}
