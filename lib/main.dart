import 'dart:async';

import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:pocket_planner/config/router.dart';
import 'package:pocket_planner/core/auth/presentation/logic/auth_controller.dart';
import 'package:pocket_planner/util/helper/local_data/get_local_data.dart';

import 'core/service_locator/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          routerConfig: router,
        );
      },
    );
  }
}
