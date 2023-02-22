import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:pocket_planner/config/app_colors.dart';
import 'package:pocket_planner/widget/custom_button.dart';
import 'package:pocket_planner/widget/custom_card_blur.dart';

import '../../auth/presentation/logic/auth_controller.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authController = Get.put(AuthController());
    Map<int, Widget> myTabs = <int, Widget>{
      0: Container(
        margin: const EdgeInsets.all(18),
        child: const Text(
          "Register",
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      1: Container(
        margin: const EdgeInsets.all(18),
        child: const Text(
          "Login",
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      )
    };
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        width: double.infinity,
        child: CustomCardBlur(
          colors: [
            Colors.grey.shade200,
            Colors.blueGrey.shade50,
            Colors.grey.shade100,
            Colors.grey.shade200,
            Colors.blueGrey.shade100,
          ],
          child: Center(
            child: Column(children: [
              Expanded(
                flex: 2,
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                  decoration: BoxDecoration(
                      color: Colors.blueGrey.shade200,
                      borderRadius: BorderRadius.circular(10)),
                  width: double.infinity,
                  child: Lottie.asset('assets/lottie_animation/onboard.json',
                      fit: BoxFit.cover),
                ),
              ),
              Expanded(
                flex: 1,
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: const [
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Discover Your\nPocket Plan Here",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Explore all most plan of the pocket\nto manage and pushing up the project",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: SizedBox(
                    width: double.infinity,
                    child: Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            height: 60,
                            ontap: () {
                              context.go('/signup/true');
                            },
                            color: AppColors.secondColor,
                            titleBTN: "Register",
                            styleBTN: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: CustomButton(
                            height: 60,
                            ontap: () {
                              context.go('/login');
                            },
                            color: AppColors.secondColor,
                            titleBTN: "Login",
                            styleBTN: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )
                    //  CupertinoSlidingSegmentedControl(
                    //     backgroundColor: AppColors.secondColor,
                    //     groupValue:
                    //         authController.segmentedControlGroupValue.value,
                    //     children: myTabs,
                    //     onValueChanged: (i) {
                    //       authController.segmentedControlGroupValue.value =
                    //           i!;
                    //       if (authController
                    //               .segmentedControlGroupValue.value ==
                    //           1) {
                    //         context.go("/login");
                    //       } else if (authController
                    //               .segmentedControlGroupValue.value ==
                    //           0) {
                    //         context.go("/signup");
                    //       }
                    //       debugPrint(
                    //           "-----------------${authController.segmentedControlGroupValue.value}");
                    //     }),
                    ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
