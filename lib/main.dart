import 'dart:async';

import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocket_planner/config/router.dart';
import 'package:pocket_planner/config/theme.dart';
import 'package:pocket_planner/core/auth/presentation/logic/auth_controller.dart';
import 'package:pocket_planner/module/planner/presentation/logic/planner_controller.dart';
import 'package:pocket_planner/util/helper/local_data/get_local_data.dart';

import 'core/service_locator/service_locator.dart';
import 'util/helper/notification_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await NotificationHelper.initial();
  configureDependencies();
  await runZonedGuarded(() async {
    await LocalDataStorage.getString('refreshToken');
    await LocalDataStorage.getCurrentUser();
    await getIt<AuthController>().funtionFetchFirst();
  }, (error, stackTrace) {
    // FirebaseCrashlytics.instance.recordError(error, stackTrace);
  });

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    getIt<AuthController>().funtionFetchFirst();
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: getIt<AuthController>().appNotifier,
      builder: (context, String value, _) {
        return Obx(
          () => MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: lightTheme(),
            darkTheme: darkTheme(),
            themeMode: getIt<PlannerController>().darkmode.value
                ? ThemeMode.dark
                : ThemeMode.light,
            routerConfig: router,
          ),
        );
      },
    );
  }
}
