import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:pocket_planner/core/service_locator/service_locator.dart';
import 'package:pocket_planner/core/auth/presentation/logic/auth_controller.dart';
import 'package:pocket_planner/widget/custom_button.dart';
import 'package:pocket_planner/widget/custom_loading.dart';

import '../../../../config/app_colors.dart';
import '../../../../widget/cuctom_textfield.dart';
import '../../../../widget/custom_card_blur.dart';

class LoginSignUpScreen extends StatelessWidget {
  const LoginSignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final authController = Get.put(AuthController());
    return Stack(
      children: [
        Scaffold(
          body: Obx(
            () => GestureDetector(
              onPanDown: (value) {
                getIt<AuthController>().focusScopePassword.value.unfocus();
                getIt<AuthController>().focusScopePhoneNumber.value.unfocus();
              },
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: CustomScrollView(
                  physics: const ClampingScrollPhysics(),
                  slivers: [
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: CustomCardBlur(
                        colors: [
                          Colors.grey.shade200,
                          Colors.blueGrey.shade50,
                          Colors.grey.shade100,
                          Colors.grey.shade200,
                          Colors.blueGrey.shade100,
                        ],
                        child: Column(
                          children: [
                            Expanded(
                              flex: 1,
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            CustomTextField(
                                                keyboardType:
                                                    TextInputType.number,
                                                focusScope:
                                                    getIt<AuthController>()
                                                        .focusScopePhoneNumber
                                                        .value,
                                                controller:
                                                    getIt<AuthController>()
                                                        .phoneController
                                                        .value,
                                                isValidate:
                                                    !getIt<AuthController>()
                                                        .phoneValidator
                                                        .value,
                                                labelText: 'Phone Number',
                                                hintText: 'Phone Number',
                                                onChange: (value) {
                                                  if (value == "") {
                                                    getIt<AuthController>()
                                                        .phoneValidator
                                                        .value = true;
                                                  } else {
                                                    getIt<AuthController>()
                                                        .phoneValidator
                                                        .value = false;
                                                  }
                                                }),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            CustomTextField(
                                                focusScope:
                                                    getIt<AuthController>()
                                                        .focusScopePassword
                                                        .value,
                                                controller:
                                                    getIt<AuthController>()
                                                        .passwordController
                                                        .value,
                                                isValidate:
                                                    !getIt<AuthController>()
                                                        .passwordValidator
                                                        .value,
                                                labelText: 'Password',
                                                hintText: 'Password',
                                                onChange: (value) {
                                                  if (value == "") {
                                                    getIt<AuthController>()
                                                        .passwordValidator
                                                        .value = true;
                                                  } else {
                                                    getIt<AuthController>()
                                                        .passwordValidator
                                                        .value = false;
                                                  }
                                                }),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            InkWell(
                                                onTap: () {
                                                  context.go('/signup/false');
                                                },
                                                child: const Text(
                                                  "Recovery Password",
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Center(
                                        child: CustomButton(
                                          height: 60,
                                          ontap: () {
                                            getIt<AuthController>()
                                                .functionLogIn(context,
                                                    phone:
                                                        getIt<AuthController>()
                                                            .phoneController
                                                            .value
                                                            .text,
                                                    password:
                                                        getIt<AuthController>()
                                                            .passwordController
                                                            .value
                                                            .text,
                                            //         funcWhenSuccess: () {
                                            //   context.go('/');
                                            // }
                                            );
                                          },
                                          color: AppColors.btnColor,
                                          titleBTN: "Log In",
                                          styleBTN: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
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
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Expanded(
                                            child: CustomButton(
                                                height: 60,
                                                ontap: () {
                                                  debugPrint("Login Google");
                                                  getIt<AuthController>()
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
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          // Expanded(
                                          //   child: CustomButton(
                                          //       height: 60,
                                          //       ontap: () async {
                                          //         // final translator =
                                          //         //     GoogleTranslator();
                                          //         // const input =
                                          //         //     "សួស្តីតើអ្នកមិនអីទេ?";

                                          //         // // Using the Future API
                                          //         // translator
                                          //         //     .translate(input, to: 'en')
                                          //         //     .then((result) => print(
                                          //         //         "Source: $input\nTranslated: $result"));

                                          //         // // Passing the translation to a variable
                                          //         // var translation =
                                          //         //     await translator.translate(
                                          //         //         "I would buy a car, if I had money.",
                                          //         //         from: 'en',
                                          //         //         to: 'it');

                                          //         // // You can also call the extension method directly on the input
                                          //         // print(
                                          //         //     'Translated: ${await input.translate(to: 'en')}');

                                          //         // // For countries that default base URL doesn't work
                                          //         // translator.baseUrl =
                                          //         //     "translate.google.cn";
                                          //         // translator.translateAndPrint(
                                          //         //     "This means 'testing' in chinese",
                                          //         //     to: 'zh-cn');
                                          //         // //prints 这意味着用中文'测试'

                                          //         // print("translation: $translation");
                                          //         // await authController
                                          //         //     .signInWithFacebook(context);
                                          //       },
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
                                    const TextSpan(text: "Create new one? "),
                                    TextSpan(
                                        text: "Sign up",
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            context.go('/signup/true');
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
        ),
        if (getIt<AuthController>().isLoading.value) const CustomLoading()
      ],
    );
  }
}
