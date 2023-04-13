import 'package:flutter/material.dart';

import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'custom_card_blur.dart';

customModelSheet(BuildContext context, {required Widget child}) {
  showCupertinoModalBottomSheet(
    // expand: true,
    // enableDrag: false,
    context: context,
    expand: true,
    backgroundColor: Colors.transparent,
    builder: (context) => Material(
      color: Colors.transparent,
      child: CustomCardBlur(child: child),
    ),
  );
}
