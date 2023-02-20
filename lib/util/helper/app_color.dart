import 'package:flutter/material.dart';

extension AppColor on Color {
  // static Color brandCardColor = Colors.white.withOpacity(0.1);
  static const secondaryColor = Color(0xFFf9c83a);
  static const primaryColor = Color(0xFF1C2329);
}

extension AppWidget on Widget {
  static Widget backgroundColorWidget = Container(
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage("asset/background.jpg"),
        fit: BoxFit.cover,
      ),
    ),
  );
}
