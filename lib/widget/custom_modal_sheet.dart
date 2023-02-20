import 'package:flutter/material.dart';

import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'custom_card_blur.dart';

customModelSheet(BuildContext context, {required Widget child}) {
  showCupertinoModalBottomSheet(
    // expand: true,
    elevation: 0.0,
    barrierColor: Colors.blueGrey.shade100,
    context: context,
    backgroundColor: Colors.blueGrey.shade100,
    builder: (context) => Material(
      color: Colors.blueGrey.shade100,
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: CustomCardBlur(
          colors: [
            Colors.grey.shade200,
            Colors.blueGrey.shade50,
            Colors.grey.shade100,
            Colors.grey.shade200,
            Colors.blueGrey.shade100,
          ],
          child: CustomScrollView(
            slivers: <Widget>[
              SliverFillRemaining(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: child))
            ],
          ),
        ),
      ),
    ),
  );
}
