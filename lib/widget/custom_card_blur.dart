import 'dart:ui';

import 'package:flutter/material.dart';

class CustomCardBlur extends StatelessWidget {
  final Widget? child;
  const CustomCardBlur({Key? key, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(15),
        ),
        width: double.infinity,
        child: child,
      ),
    );
  }
}
