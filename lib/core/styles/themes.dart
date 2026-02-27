import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taskati_app/core/constants/app_fonts.dart';
import 'package:taskati_app/core/styles/colors.dart';
import 'package:taskati_app/core/styles/text_style.dart';

class AppTheme {
  static ThemeData get light => ThemeData(
    fontFamily: AppFonts.lexandDeca,
    scaffoldBackgroundColor: Colors.transparent,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
      onSurface: AppColors.blackColor,
    ),
    dividerColor: Colors.transparent,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        padding: EdgeInsets.all(0),
        minimumSize: Size.zero,
        foregroundColor: AppColors.primaryColor,
      ),
    ),
    inputDecorationTheme: InputDecorationThemeData(
      fillColor: AppColors.whiteColor,
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide.none,
      ),
      hintStyle: AppTextStyles.caption1.copyWith(
        color: AppColors.seconderyColor,
      ),
    ),
    appBarTheme: AppBarThemeData(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      titleTextStyle: AppTextStyles.headline.copyWith(
        color: AppColors.blackColor,
        fontFamily: AppFonts.lexandDeca,
      ),
    ),
  );
}
