import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../util/helper/local_data/get_local_data.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () async {
      var token = await LocalDataStorage.getCurrentUser();
      if (token != '') {
        GoRouter.of(context).go('/');
      } else {
        GoRouter.of(context).go('/onBoarding');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.purple,
      body: Center(
        child: Text(
          "Plan Pro",
          style: TextStyle(
              fontSize: 40,
              color: Colors.white,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
