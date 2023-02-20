import 'package:flutter/material.dart';

import '../config/app_colors.dart';

Widget customListMember(
  BuildContext context, {
  required List<String> listImage,
  double widthIF = 22,
  double heightIF = 24,
  double radiusImage = 10,
  double borderWidth = 1.4,
}) {
  return SizedBox(
    height: heightIF,
    width: widthIF,
    child: Stack(
      children: listImage.asMap().entries.map((e) {
        if (e.key > 3) {
          return e.key >= 5
              ? Container()
              : FractionalTranslation(
                  translation: Offset((e.key / 1.4), 0),
                  child: Container(
                    decoration: BoxDecoration(
                      border:
                          Border.all(width: borderWidth, color: Colors.white),
                      color: AppColors.primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        "+${listImage.length - 4}",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                );
        }
        return FractionalTranslation(
          translation: Offset((e.key / 1.4), 0),
          child: Container(
            padding: EdgeInsets.all(radiusImage),
            decoration: BoxDecoration(
              border: Border.all(width: borderWidth, color: Colors.white),
              color: Colors.white,
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: NetworkImage(
                    e.value,
                  ),
                  fit: BoxFit.cover),
            ),
          ),
        );
      }).toList(),
    ),
  );
}
