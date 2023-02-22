// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:pocket_planner/core/auth/data/repository/auth_repository.dart';

import 'package:pocket_planner/util/helper/extension.dart';

import '../../../service_locator/service_locator.dart';

class AuthController extends GetxController
    with GetSingleTickerProviderStateMixin {
  @factoryMethod
  static init() => Get.put(AuthController());

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
  final focusScopePhoneNumber = FocusNode().obs;
  final focusScopePassword = FocusNode().obs;

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

  ///Key form:
  final formKey = GlobalKey<FormState>();

  ///////////////Function Fetching Or Posting API//////////////// :

  ///Function Get OTP:
  final isLoadingGetOTP = false.obs;
  fucntionRequesOtp(BuildContext context,
      {required String phone, Function? funcWhenSuccess}) async {
    isLoadingGetOTP(true);
    await getIt<AuthReposity>()
        .getAuthOTP("855${phone.removeZeroFront()}", context, funcWhenSuccess)
        .then((value) {});

    isLoadingGetOTP(false);
  }

  ///Function Verify OTP:
  fucntionVerifyOtp(BuildContext context, {String? code}) {}

  final FirebaseAuth auth = FirebaseAuth.instance;

  ///Function Login google with silently:
  Future<void> signInWithGoogleSilently() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();

      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signInSilently();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        await FirebaseAuth.instance.signInWithCredential(credential);
      }
    } catch (error) {
      rethrow;
    }
  }

  ///Fucntion Login Google:

  Future<void> signupWithGoogle(BuildContext context) async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      // Getting users credential
      UserCredential result = await auth.signInWithCredential(authCredential);
      User user = result.user!;
      var token = await user.getIdToken();
      log(token);
      if (result.user != null) {
        context.go('/');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  ///Function Login Facebook
  signInWithFacebook(BuildContext context) async {
    final LoginResult result = await FacebookAuth.instance.login(permissions: [
      'email',
      'public_profile',
      'user_birthday',
      'user_friends',
      'user_gender',
      'user_link'
    ]); // by default we request the email and the public profile
// or FacebookAuth.i.login()

    if (result.status == LoginStatus.success) {
      final OAuthCredential credential =
          FacebookAuthProvider.credential(result.accessToken!.token);
      await FirebaseAuth.instance.signInWithCredential(credential);
      final userData = await FacebookAuth.instance.getUserData(
          fields: "name,email,picture.width(200),birthday,friends,gender,link");
      // you are logged
      // final AccessToken accessToken = result.accessToken!;
      // debugPrint(accessToken.token);
      if (userData.isNotEmpty) {
        context.go('/');
      }
      print(userData);
    } else {
      debugPrint(result.status.toString());
      debugPrint(result.message);
    }
  }

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
