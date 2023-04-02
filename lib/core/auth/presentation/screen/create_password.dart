import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:pocket_planner/core/auth/presentation/logic/auth_controller.dart';
import 'package:pocket_planner/widget/custom_loading.dart';

import '../../../../config/app_colors.dart';
import '../../../../widget/cuctom_textfield.dart';
import '../../../../widget/custom_button.dart';
import '../../../../widget/custom_card_blur.dart';
import '../../../../widget/custom_validation_message.dart';
import '../../../service_locator/service_locator.dart';

class CreatePassword extends StatelessWidget {
  const CreatePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authController = Get.put(AuthController());
    // final formKey = GlobalKey<FormState>();
    return Stack(
      children: [
        Scaffold(
          body: SafeArea(
            top: false,
            minimum: const EdgeInsets.only(bottom: 16),
            child: GestureDetector(
              onPanDown: (value) {
                getIt<AuthController>().focusScopePassword.value.unfocus();
              },
              child: GetBuilder(
                init: authController,
                builder: (controller) => CustomCardBlur(
                  colors: [
                    Colors.grey.shade200,
                    Colors.blueGrey.shade50,
                    Colors.grey.shade100,
                    Colors.grey.shade200,
                    Colors.blueGrey.shade100,
                  ],
                  child: CustomScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    slivers: [
                      SliverFillRemaining(
                        hasScrollBody: false,
                        child: Column(
                          children: [
                            SizedBox(
                              height: Get.height * 0.22,
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(right: Get.height * 0.08),
                              child: const Text(
                                "Create",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 99, 16, 114),
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic,
                                    fontSize: 30),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 60),
                              child: Text(
                                "Password",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 99, 16, 114),
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic,
                                    fontSize: 30),
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: Obx(
                                () => GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    color: Colors.transparent,
                                    padding: EdgeInsets.only(
                                        bottom: MediaQuery.of(context)
                                            .viewInsets
                                            .bottom),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20, right: 20, top: 20),
                                          child: Text(
                                            'Create new password',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineSmall!,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 20, left: 20, right: 20),
                                          child: CustomTextField(
                                            focusScope: getIt<AuthController>()
                                                .focusScopePassword
                                                .value,
                                            hintText: 'Enter password',
                                            labelText: 'New password',
                                            controller: authController
                                                .passwordController.value,
                                            isValidate: !authController
                                                .passwordValidator.value,
                                            onChange: (value) {
                                              if (value == '') {
                                                authController.passwordValidator
                                                    .value = true;
                                              } else {
                                                authController.passwordValidator
                                                    .value = false;
                                              }
                                              authController.update();
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 20, left: 20, right: 20),
                                          child: CustomValidatorMessage(
                                            description:
                                                'Password must be bigger than or equal 8',
                                            isValidate: true,
                                            icon: Icons.check_circle,
                                            color: authController
                                                            .passwordController
                                                            .value
                                                            .text
                                                            .length >=
                                                        8 &&
                                                    authController
                                                            .passwordController
                                                            .value
                                                            .text
                                                            .length <=
                                                        18
                                                ? Theme.of(context).primaryColor
                                                : const Color(0xff9E9E9E),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 15, left: 20, right: 20),
                                          child: CustomValidatorMessage(
                                            description:
                                                'Password must have 1 number',
                                            isValidate: true,
                                            icon: Icons.check_circle,
                                            color: authController
                                                        .passwordController
                                                        .value
                                                        .text
                                                        .contains(
                                                            RegExp(r'[A-Za-z]'),
                                                            0) &&
                                                    authController
                                                        .passwordController
                                                        .value
                                                        .text
                                                        .contains(
                                                            RegExp(r'[0-9]'), 0)
                                                ? Theme.of(context).primaryColor
                                                : const Color(0xff9E9E9E),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 15,
                                              left: 20,
                                              right: 20,
                                              bottom: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.012),
                                          child: CustomValidatorMessage(
                                            description:
                                                'Password must have 1 symbol',
                                            isValidate: true,
                                            icon: Icons.check_circle,
                                            color: authController
                                                    .passwordController
                                                    .value
                                                    .text
                                                    .contains(
                                                        RegExp(r'[!@#\$&*~]'))
                                                ? Theme.of(context).primaryColor
                                                : const Color(0xff9E9E9E),
                                          ),
                                        ),
                                        const Spacer(),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: CustomButton(
                                            color: authController
                                                    .functionCheckValidatoin()
                                                ? Colors.grey
                                                : AppColors.primaryColor,
                                            isDisable: authController
                                                .functionCheckValidatoin(),
                                            ontap: () async {
                                              getIt<AuthController>()
                                                  .functionSignUp(context,
                                                      phone: getIt<
                                                              AuthController>()
                                                          .phoneController
                                                          .value
                                                          .text,
                                                      password: getIt<
                                                              AuthController>()
                                                          .passwordController
                                                          .value
                                                          .text,
                                                      funcWhenSuccess: () {
                                                context.go('/');
                                              });
                                            },
                                            isTitleOnly: false,
                                            child: const Text(
                                              "Continue",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
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
