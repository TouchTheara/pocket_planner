import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class AuthController extends GetxController
    with GetSingleTickerProviderStateMixin {
  ///Bool Checking:
  final isRegister = true.obs;
  final phoneValidator = false.obs;
  final passwordValidator = false.obs;
  final isRecoveryPassword = false.obs;

  ///Controller :
  final phoneController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final verifyOtpController = TextEditingController().obs;
  StreamController<ErrorAnimationType>? errorAnimationController;
  AnimationController? animatedController;
  final segmentedControlGroupValue = 0.obs;
  final countController = 1.obs;
  final fullNameController = TextEditingController().obs;

  ///Funciton Check time animation:
  String get timerString {
    Duration duration =
        animatedController!.duration! * animatedController!.value;

    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  var stringListReturnedFromApiCall = [
    "first",
    "second",
    "third",
    "fourth",
    "..."
  ];

  ///Function check validation:
  bool functionCheckValidatoin() {
    if (passwordController.value.text.contains(RegExp(r'[A-Za-z]')) == false ||
        passwordController.value.text.contains(RegExp(r'[0-9]')) == false ||
        passwordController.value.text.contains(RegExp(r'[!@#\$&*~]')) ==
            false ||
        passwordController.value.text.length < 8 ||
        passwordController.value.text.length > 18) {
      return true;
    }
    return false;
  }

  ///Key:
  final formKey = GlobalKey<FormState>();

  ///Function Fetching Or Posting API:
  fucntionVerifyOtp(BuildContext context, {String? code}) {}
  fucntionRequesOtp(BuildContext context) {}

  @override
  void onInit() {
    super.onInit();
    animatedController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1000,
      ),
    );
  }

  @override
  void dispose() {
    if (animatedController != null) {
      animatedController!.dispose();
    }
    super.dispose();
  }
}
