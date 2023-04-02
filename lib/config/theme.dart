import 'package:flutter/material.dart';

import '../gen/fonts.gen.dart';
import 'app_colors.dart';

ThemeData lightTheme() {
  return ThemeData.light().copyWith(
    // useMaterial3: true,
    primaryColor: AppColors.primaryColor,
    secondaryHeaderColor: AppColors.secondColor,
    disabledColor: AppColors.disableColor,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primaryColor,
      onPrimary: AppColors.bgColor,
      secondary: AppColors.secondColor,
      onSecondary: AppColors.bgColor,
      error: AppColors.errorColor,
      onError: AppColors.bgColor,
      background: AppColors.bgColor,
      onBackground: Colors.black,
      surface: AppColors.bgColor,
      onSurface: Colors.black,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.bgColor,
      elevation: 1.5,
      shadowColor: Colors.white.withOpacity(0.5),
      centerTitle: true,
      iconTheme: const IconThemeData(color: Colors.black),
      titleTextStyle: const TextStyle(
        fontFamily: FontFamily.notoSans,
        fontWeight: FontWeight.w600,
        fontSize: 18,
        color: Colors.black,
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: AppColors.bgColor,
      iconTheme: MaterialStateProperty.all(const IconThemeData(size: 25)),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontFamily: FontFamily.notoSans,
          color: Colors.black,
          fontWeight: FontWeight.normal,
          fontSize: 57,
          height: 1),
      displayMedium: TextStyle(
          fontFamily: FontFamily.notoSans,
          color: Colors.black,
          fontWeight: FontWeight.normal,
          fontSize: 45,
          height: 1),
      displaySmall: TextStyle(
          fontFamily: FontFamily.notoSans,
          color: Colors.black,
          fontWeight: FontWeight.normal,
          fontSize: 36,
          height: 1),
      headlineLarge: TextStyle(
          fontFamily: FontFamily.notoSans,
          color: Colors.black,
          fontWeight: FontWeight.normal,
          fontSize: 24,
          height: 1),
      headlineMedium: TextStyle(
          fontFamily: FontFamily.notoSans,
          color: Colors.black,
          fontWeight: FontWeight.normal,
          fontSize: 20,
          height: 1),
      headlineSmall: TextStyle(
          fontFamily: FontFamily.notoSans,
          color: Colors.black,
          fontWeight: FontWeight.normal,
          fontSize: 18,
          height: 1),
      titleLarge: TextStyle(
          fontFamily: FontFamily.notoSans,
          color: Colors.black,
          fontWeight: FontWeight.normal,
          fontSize: 22,
          height: 1),
      titleMedium: TextStyle(
          fontFamily: FontFamily.notoSans,
          color: Colors.black,
          fontWeight: FontWeight.normal,
          fontSize: 16,
          height: 1),
      titleSmall: TextStyle(
          fontFamily: FontFamily.notoSans,
          color: Colors.black,
          fontWeight: FontWeight.normal,
          fontSize: 14,
          height: 1),
      labelLarge: TextStyle(
          fontFamily: FontFamily.notoSans,
          color: Colors.black,
          fontWeight: FontWeight.normal,
          fontSize: 13,
          height: 1),
      labelMedium: TextStyle(
          fontFamily: FontFamily.notoSans,
          color: Colors.black,
          fontWeight: FontWeight.normal,
          fontSize: 12,
          height: 1),
      labelSmall: TextStyle(
          fontFamily: FontFamily.notoSans,
          color: Colors.black,
          fontWeight: FontWeight.normal,
          fontSize: 11,
          height: 1),
      bodyLarge: TextStyle(
          fontFamily: FontFamily.notoSans,
          color: Colors.black,
          fontWeight: FontWeight.normal,
          fontSize: 16,
          height: 1),
      bodyMedium: TextStyle(
          fontFamily: FontFamily.notoSans,
          color: Colors.black,
          fontWeight: FontWeight.normal,
          fontSize: 14,
          height: 1),
      bodySmall: TextStyle(
          fontFamily: FontFamily.notoSans,
          color: Colors.black,
          fontWeight: FontWeight.normal,
          fontSize: 12,
          height: 1),
    ),
    elevatedButtonTheme: const ElevatedButtonThemeData(style: ButtonStyle()),
  );
}

ThemeData darkTheme() {
  return ThemeData.dark().copyWith(
      // useMaterial3: true,
      primaryColor: AppColors.primaryColor,
      secondaryHeaderColor: AppColors.secondColor,
      disabledColor: AppColors.disableColor,
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.primaryColor,
        onPrimary: AppColors.bgColor,
        secondary: AppColors.secondColor,
        onSecondary: AppColors.bgColor,
        error: AppColors.errorColor,
        onError: AppColors.bgColor,
        background: Colors.black,
        onBackground: Colors.black,
        surface: AppColors.bgColor,
        onSurface: Colors.black,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.black,
        elevation: 1.5,
        shadowColor: Colors.black.withOpacity(0.5),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: const TextStyle(
          fontFamily: FontFamily.notoSans,
          fontWeight: FontWeight.w600,
          fontSize: 18,
          color: Colors.white,
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: AppColors.bgColor,
        iconTheme: MaterialStateProperty.all(const IconThemeData(size: 25)),
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
            fontFamily: FontFamily.notoSans,
            color: Colors.white,
            fontWeight: FontWeight.normal,
            fontSize: 57,
            height: 1),
        displayMedium: TextStyle(
            fontFamily: FontFamily.notoSans,
            color: Colors.white,
            fontWeight: FontWeight.normal,
            fontSize: 45,
            height: 1),
        displaySmall: TextStyle(
            fontFamily: FontFamily.notoSans,
            color: Colors.white,
            fontWeight: FontWeight.normal,
            fontSize: 36,
            height: 1),
        headlineLarge: TextStyle(
            fontFamily: FontFamily.notoSans,
            color: Colors.white,
            fontWeight: FontWeight.normal,
            fontSize: 24,
            height: 1),
        headlineMedium: TextStyle(
            fontFamily: FontFamily.notoSans,
            color: Colors.white,
            fontWeight: FontWeight.normal,
            fontSize: 20,
            height: 1),
        headlineSmall: TextStyle(
            fontFamily: FontFamily.notoSans,
            color: Colors.white,
            fontWeight: FontWeight.normal,
            fontSize: 18,
            height: 1),
        titleLarge: TextStyle(
            fontFamily: FontFamily.notoSans,
            color: Colors.white,
            fontWeight: FontWeight.normal,
            fontSize: 22,
            height: 1),
        titleMedium: TextStyle(
            fontFamily: FontFamily.notoSans,
            color: Colors.white,
            fontWeight: FontWeight.normal,
            fontSize: 16,
            height: 1),
        titleSmall: TextStyle(
            fontFamily: FontFamily.notoSans,
            color: Colors.white,
            fontWeight: FontWeight.normal,
            fontSize: 14,
            height: 1),
        labelLarge: TextStyle(
            fontFamily: FontFamily.notoSans,
            color: Colors.white,
            fontWeight: FontWeight.normal,
            fontSize: 13,
            height: 1),
        labelMedium: TextStyle(
            fontFamily: FontFamily.notoSans,
            color: Colors.white,
            fontWeight: FontWeight.normal,
            fontSize: 12,
            height: 1),
        labelSmall: TextStyle(
            fontFamily: FontFamily.notoSans,
            color: Colors.white,
            fontWeight: FontWeight.normal,
            fontSize: 11,
            height: 1),
        bodyLarge: TextStyle(
            fontFamily: FontFamily.notoSans,
            color: Colors.white,
            fontWeight: FontWeight.normal,
            fontSize: 16,
            height: 1),
        bodyMedium: TextStyle(
            fontFamily: FontFamily.notoSans,
            color: Colors.white,
            fontWeight: FontWeight.normal,
            fontSize: 14,
            height: 1),
        bodySmall: TextStyle(
            fontFamily: FontFamily.notoSans,
            color: Colors.white,
            fontWeight: FontWeight.normal,
            fontSize: 12,
            height: 1),
      ),
      elevatedButtonTheme: const ElevatedButtonThemeData(style: ButtonStyle()),
      listTileTheme: const ListTileThemeData(
        iconColor: Colors.white,
      ));
}
