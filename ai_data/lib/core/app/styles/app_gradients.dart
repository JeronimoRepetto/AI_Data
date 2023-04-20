import 'package:ai_data/core/app/styles/app_colors.dart';
import 'package:flutter/material.dart';

class AppGradients {
  static const LinearGradient primaryColorGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment(0.0, 1.0), // 10% of the width, so there are ten blinds.
    colors: <Color>[
      AppColors.primaryGradient,
      AppColors.secondaryGradient,
      AppColors.terciaryGradient,
    ], // red to yellow
    tileMode: TileMode.repeated, // repeats the gradient over the canvas
  );
}
