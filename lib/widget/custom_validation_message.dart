import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:pocket_planner/config/app_colors.dart';

class CustomValidatorMessage extends StatelessWidget {
  final bool? isValidate;
  final String? description;
  final Color? color;
  final IconData? icon;
  const CustomValidatorMessage({
    Key? key,
    this.description,
    this.color,
    this.icon,
    this.isValidate = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isValidate == false
        ? Container()
        : Row(
            children: [
              icon != null
                  ? Icon(
                      icon,
                      size: 15,
                      color: (() {
                        if (color != null) {
                          return color;
                        } else {
                          return AppColors.errorColor;
                        }
                      }()),
                    )
                  : Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationZ(math.pi),
                      child: Icon(
                        (() {
                          if (icon != null) {
                            return icon;
                          } else {
                            return Icons.info_rounded;
                          }
                        }()),
                        size: 15,
                        color: (() {
                          if (color != null) {
                            return color;
                          } else {
                            return AppColors.errorColor;
                          }
                        }()),
                      ),
                    ),
              const SizedBox(
                width: 9,
              ),
              Expanded(
                child: Text(description != null ? description! : "",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 13,
                          color: (() {
                            if (color != null) {
                              return color;
                            } else {
                              return AppColors.errorColor;
                            }
                          }()),
                          fontWeight: FontWeight.normal,
                        )),
              ),
            ],
          );
  }
}
