import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      this.borderColor,
      this.color,
      this.radius,
      this.titleBTN,
      this.isDisable = false,
      this.isTitleOnly = true,
      this.width,
      this.borderWidth,
      this.height,
      this.child,
      this.ontap,
      this.styleBTN})
      : super(key: key);
  final Color? color;
  final Color? borderColor;
  final double? borderWidth;
  final double? radius;
  final double? height;
  final double? width;
  final String? titleBTN;
  final bool isDisable;
  final Function? ontap;
  final TextStyle? styleBTN;
  final bool isTitleOnly;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isDisable
          ? null
          : () {
              ontap?.call();
            },
      child: Container(
        height: height ?? 50,
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(radius ?? 10),
            border: Border.all(
              width: borderWidth ?? 1,
              color: borderColor ?? Colors.transparent,
            ),
            boxShadow: const [BoxShadow()]),
        child: isTitleOnly
            ? Text(
                '$titleBTN',
                style: styleBTN,
              )
            : child,
      ),
    );
  }
}
