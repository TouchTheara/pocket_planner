import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:pocket_planner/core/auth/controller/auth_controller.dart';

import '../../../config/app_colors.dart';
import '../../../widget/cuctom_textfield.dart';
import '../../../widget/custom_button.dart';
import '../../../widget/custom_card_blur.dart';
import '../../../widget/custom_validation_message.dart';

class CreatePassword extends StatelessWidget {
  const CreatePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authController = Get.put(AuthController());
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      body: SafeArea(
        top: false,
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
            child: Column(
              children: [
                SizedBox(
                  height: Get.height * 0.15,
                ),
                Expanded(
                  flex: 2,
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Create",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromARGB(255, 99, 16, 114),
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              fontSize: 30),
                        ),
                        Padding(
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
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Obx(
                    () => Form(
                      key: formKey,
                      child: GestureDetector(
                        onTap: () {
                          FocusScope.of(context).unfocus();
                        },
                        child: Container(
                          color: Colors.transparent,
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                  hintText: 'Enter password',
                                  labelText: 'New password',
                                  suffixIcon: GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      height: 20,
                                      width: 30,
                                      padding: const EdgeInsets.only(
                                        right: 10,
                                      ),
                                      child: Center(
                                        child: SvgPicture.asset(
                                          'assets/icons/eye_close.svg',
                                        ),
                                      ),
                                    ),
                                  ),
                                  controller:
                                      authController.passwordController.value,
                                  isValidate:
                                      !authController.passwordValidator.value,
                                  onChange: (value) {
                                    if (value == '') {
                                      authController.passwordValidator.value =
                                          true;
                                    } else {
                                      authController.passwordValidator.value =
                                          false;
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
                                  color: authController.passwordController.value
                                                  .text.length >=
                                              8 &&
                                          authController.passwordController
                                                  .value.text.length <=
                                              18
                                      ? Theme.of(context).primaryColor
                                      : const Color(0xff9E9E9E),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 15, left: 20, right: 20),
                                child: CustomValidatorMessage(
                                  description: 'Password must have 1 number',
                                  isValidate: true,
                                  icon: Icons.check_circle,
                                  color: authController
                                              .passwordController.value.text
                                              .contains(
                                                  RegExp(r'[A-Za-z]'), 0) &&
                                          authController
                                              .passwordController.value.text
                                              .contains(RegExp(r'[0-9]'), 0)
                                      ? Theme.of(context).primaryColor
                                      : const Color(0xff9E9E9E),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 15, left: 20, right: 20),
                                child: CustomValidatorMessage(
                                  description: 'Password must have 1 symbol',
                                  isValidate: true,
                                  icon: Icons.check_circle,
                                  color: authController
                                          .passwordController.value.text
                                          .contains(RegExp(r'[!@#\$&*~]'))
                                      ? Theme.of(context).primaryColor
                                      : const Color(0xff9E9E9E),
                                ),
                              ),
                              const Spacer(),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: CustomButton(
                                  color:
                                      authController.functionCheckValidatoin()
                                          ? Colors.grey
                                          : AppColors.primaryColor,
                                  isDisable:
                                      authController.functionCheckValidatoin(),
                                  ontap: () async {
                                    context.go('/');
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
