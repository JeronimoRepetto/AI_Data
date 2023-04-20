import 'package:ai_data/core/app/styles/app_colors.dart';
import 'package:flutter/material.dart';

class AppGradients {
  static const LinearGradient primaryColorGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment(0.0, 1.0), // 10% of the width, so there are ten blinds.
    colors: <Color>[
      AppColors.superLigthGreen,
      AppColors.ligthGreen,
      AppColors.ligthyellow,
      AppColors.ligthyellowGrenn,
      AppColors.superLigthyellowGrenn,
    ], // red to yellow
    tileMode: TileMode.repeated, // repeats the gradient over the canvas
  );
  static LinearGradient imageGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: const [
      0.05,
      0.5,
    ],
    colors: [
      Colors.black.withOpacity(.8),
      Colors.black.withOpacity(.1),
    ],
  );
}
