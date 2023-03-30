// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:pocket_planner/core/auth/data/repository/auth_repository.dart';

import 'package:pocket_planner/util/helper/extension.dart';

import '../../../../util/helper/local_data/get_local_data.dart';
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
  ValueNotifier<String> appNotifier = ValueNotifier('');
  final hashValue = ''.obs;
  final refreshToken = ''.obs;

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
  final isLoading = false.obs;

  ///////////////Function Fetching Or Posting API//////////////// :

  ///Function Get OTP:
  fucntionRequesOtp(BuildContext context,
      {required String phone, Function? funcWhenSuccess}) async {
    isLoading(true);
    await getIt<AuthReposity>()
        .getAuthOTP(
            phone: "855${phone.removeZeroFront()}",
            context,
            funcWhenSuccess: funcWhenSuccess)
        .then((value) {});

    isLoading(false);
  }

  ///Function Verify OTP:

  fucntionVerifyOtp(BuildContext context,
      {required String code, Function? funcWhenSuccess, String? phone}) async {
    isLoading(true);
    await getIt<AuthReposity>().verifyAuthOTP(
        phone: "855${phone!.removeZeroFront()}",
        context,
        funcWhenSuccess: funcWhenSuccess,
        otp: code,
        hash: hashValue.value);
    isLoading(false);
  }

  ///Function Sign Up:

  functionSignUp(BuildContext context,
      {Function? funcWhenSuccess, String? phone, String? password}) async {
    isLoading(true);
    await getIt<AuthReposity>().signUpAuth(
        phone: "855${phone!.removeZeroFront()}",
        context,
        funcWhenSuccess: funcWhenSuccess,
        password: password);
    isLoading(false);
  }

  ///Function LogIn:

  functionLogIn(BuildContext context,
      {Function? funcWhenSuccess, String? phone, String? password}) async {
    isLoading(true);
    await getIt<AuthReposity>().logInAuth(
        phone: "855${phone!.removeZeroFront()}",
        context,
        funcWhenSuccess: funcWhenSuccess,
        password: password);
    isLoading(false);
  }

  ///Function Refresh Token:

  getRefreshToken() async {
    isLoading(true);

    await getIt<AuthReposity>()
        .getRefreshToken(
      phone: "855${phoneController.value.text.removeZeroFront()}",
    )
        .then((value) {
      isLoading(false);
    });
    isLoading(false);
  }

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
        await LocalDataStorage.storeCurrentUser(token).then((value) {
          getIt<AuthController>().funtionFetchFirst();

          context.go('/');
        });
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

//   ///Function Login Facebook
//   signInWithFacebook(BuildContext context) async {
//     final LoginResult result = await FacebookAuth.instance.login(permissions: [
//       'email',
//       'public_profile',
//       'user_birthday',
//       'user_friends',
//       'user_gender',
//       'user_link'
//     ]); // by default we request the email and the public profile
// // or FacebookAuth.i.login()

//     if (result.status == LoginStatus.success) {
//       final OAuthCredential credential =
//           FacebookAuthProvider.credential(result.accessToken!.token);
//       await FirebaseAuth.instance.signInWithCredential(credential);
//       final userData = await FacebookAuth.instance.getUserData(
//           fields: "name,email,picture.width(200),birthday,friends,gender,link");
//       // you are logged
//       // final AccessToken accessToken = result.accessToken!;
//       // debugPrint(accessToken.token);
//       if (userData.isNotEmpty) {
//         context.go('/');
//       }
//       print(userData);
//     } else {
//       debugPrint(result.status.toString());
//       debugPrint(result.message);
//     }
//   }

  functionClearToken(BuildContext context) async {
    await LocalDataStorage.removeCurrentUser();
    await getIt<AuthController>().funtionFetchFirst();
  }

  funtionFetchFirst() async {
    await LocalDataStorage.getString('refreshToken');
    var token = await LocalDataStorage.getCurrentUser();
    getIt<AuthController>().appNotifier.value = token;
    getIt<AuthController>().appNotifier.notifyListeners();
    // debugPrint("-----------------${getIt<AuthController>().appNotifier}");
    update();
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
