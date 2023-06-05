import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  initFunc() async {
    debugPrint("---------Testing Get Service---------");
    // WidgetsFlutterBinding.ensureInitialized();

    // await NotificationHelper.initial();
    // await runZonedGuarded(() async {
    //   await LocalDataStorage.getString('refreshToken');
    //   await LocalDataStorage.getCurrentUser();
    //   await getIt<AuthController>().funtionFetchFirst();
    // }, (error, stackTrace) {
    //   // FirebaseCrashlytics.instance.recordError(error, stackTrace);
    // });
  }

  // @override
  // void onInit() {
  //   initFunc();
  //   super.onInit();
  // }
}
