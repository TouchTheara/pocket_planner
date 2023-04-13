import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:pocket_planner/config/app_colors.dart';
import 'package:pocket_planner/core/auth/presentation/logic/auth_controller.dart';
import 'package:pocket_planner/widget/custom_button.dart';

import '../../../../widget/custom_loading.dart';
import '../../../service_locator/service_locator.dart';
import '../../../../widget/cuctom_textfield.dart';
import '../../../../widget/custom_card_blur.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key, this.isRegister = true}) : super(key: key);
  final bool isRegister;

  @override
  Widget build(BuildContext context) {
    final authController = Get.put(AuthController());

    return Obx(
      () => Stack(
        children: [
          Scaffold(
            body: GestureDetector(
              onPanDown: (details) {
                getIt<AuthController>().focusScopePhoneNumber.value.unfocus();
              },
              child: SizedBox(
                child: CustomScrollView(
                  physics: const ClampingScrollPhysics(),
                  slivers: [
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: CustomCardBlur(
                        // colors: [
                        //   Colors.grey.shade200,
                        //   Colors.blueGrey.shade50,
                        //   Colors.grey.shade100,
                        //   Colors.grey.shade200,
                        //   Colors.blueGrey.shade100,
                        // ],
                        child: Column(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: const BoxDecoration(),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text('Hello Again!',
                                        style: TextStyle(
                                            fontSize: 35,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text("Wellcome back you've\nbeen missed",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.black)),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Form(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          children: [
                                            CustomTextField(
                                                focusScope: authController
                                                    .focusScopePhoneNumber
                                                    .value,
                                                keyboardType:
                                                    TextInputType.number,
                                                controller: authController
                                                    .phoneController.value,
                                                isValidate: !authController
                                                    .phoneValidator.value,
                                                labelText: 'Phone Number',
                                                hintText: 'Phone Number',
                                                onChange: (value) {
                                                  if (value == "") {
                                                    authController
                                                        .phoneValidator
                                                        .value = true;
                                                  } else {
                                                    authController
                                                        .phoneValidator
                                                        .value = false;
                                                  }
                                                }),
                                            const SizedBox(
                                              height: 20,
                                            )
                                          ],
                                        ),
                                      ),
                                      Center(
                                        child: CustomButton(
                                          height: 60,
                                          ontap: () {
                                            getIt<AuthController>()
                                                .fucntionRequesOtp(context,
                                                    phone:
                                                        getIt<AuthController>()
                                                            .phoneController
                                                            .value
                                                            .text,
                                                    funcWhenSuccess: () {
                                              context.go('/otp');
                                            });

                                            // getIt<AuthController>()
                                            //     .phoneController
                                            //     .value
                                            //     .text = '';
                                          },
                                          color: AppColors.btnColor,
                                          titleBTN:
                                              isRegister ? "Register" : "Reset",
                                          styleBTN: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              height: 1,
                                              color: Colors.black,
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          const Text(
                                            "or continue with",
                                          ),
                                          const SizedBox(width: 10),
                                          Expanded(
                                            child: Container(
                                              height: 1,
                                              color: Colors.black,
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: CustomButton(
                                                height: 60,
                                                ontap: () {
                                                  debugPrint("Login Google");
                                                  authController
                                                      .signupWithGoogle(
                                                          context);
                                                  // authController.signInWithGoogleSilently();
                                                },
                                                color: Colors.grey.shade100,
                                                borderColor: Colors.white,
                                                borderWidth: 2,
                                                isTitleOnly: false,
                                                styleBTN: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Image.asset(
                                                      'assets/images/googlelogo.png',
                                                      fit: BoxFit.cover,
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    const Text(
                                                      "Login with Google",
                                                      style: TextStyle(
                                                          color: AppColors
                                                              .primaryColor,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )
                                                  ],
                                                )),
                                          ),
                                          // const SizedBox(
                                          //   width: 10,
                                          // ),
                                          // CustomButton(
                                          //     height: 60,
                                          //     width: 90,
                                          //     ontap: () {},
                                          //     color: Colors.grey.shade100,
                                          //     borderColor: Colors.white,
                                          //     borderWidth: 2,
                                          //     isTitleOnly: false,
                                          //     styleBTN: const TextStyle(
                                          //         color: Colors.white,
                                          //         fontSize: 16,
                                          //         fontWeight: FontWeight.bold),
                                          //     child: Image.asset(
                                          //       height: 40,
                                          //       "assets/images/Apple_logo_black.svg.png",
                                          //       fit: BoxFit.cover,
                                          //     )),
                                          // Expanded(
                                          //   child: CustomButton(
                                          //       height: 60,
                                          //       ontap: () {},
                                          //       color: Colors.grey.shade100,
                                          //       borderColor: Colors.white,
                                          //       borderWidth: 2,
                                          //       isTitleOnly: false,
                                          //       styleBTN: const TextStyle(
                                          //           color: Colors.white,
                                          //           fontSize: 16,
                                          //           fontWeight: FontWeight.bold),
                                          //       child: Image.asset(
                                          //         height: 40,
                                          //         "assets/images/Facebook_Logo_(2019).png",
                                          //         fit: BoxFit.cover,
                                          //       )),
                                          // ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const Spacer(),
                            Center(
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    const TextSpan(
                                        text: "Already have account? "),
                                    TextSpan(
                                        text: "Log In",
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            context.go("/login");
                                          },
                                        style: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.purple)),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Center(
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    const TextSpan(
                                        text: "By continue you agree to our "),
                                    TextSpan(
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () => GoRouter.of(context)
                                              .push('/terms'),
                                        text: "Terms and Conditions.",
                                        style: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.purple)),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          if (getIt<AuthController>().isLoading.value) const CustomLoading()
        ],
      ),
    );
  }
}
