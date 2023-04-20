import 'package:ai_data/core/app/styles/app_colors.dart';
import 'package:ai_data/core/app/styles/app_text_style.dart';
import 'package:flutter/material.dart';

final appThemeData = ThemeData(
  badgeTheme: BadgeThemeData(
    backgroundColor: AppColors.primary,
    textColor: AppColors.naturalGrey,
    textStyle: AppTextStyle.brandStyle,
  ),
  disabledColor: Colors.transparent,
  inputDecorationTheme: const InputDecorationTheme(
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.transparent,
      ),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.secondaryGradient,
      ),
    ),
  ),
);
