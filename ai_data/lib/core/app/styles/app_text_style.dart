import 'package:ai_data/core/app/styles/app_colors.dart';
import 'package:ai_data/core/app/styles/app_font_size.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  ///
  /// NEW TEXTSTYLES
  ///
  static final brandStyle = GoogleFonts.orbitron(
    fontSize: AppFontSize.xl,
    color: AppColors.naturalGrey,
    fontWeight: FontWeight.bold,
  );

  static final titleStyle = GoogleFonts.orbitron(
    fontSize: AppFontSize.l,
    color: AppColors.naturalGrey,
    fontWeight: FontWeight.bold,
  );
  static final simpleTextBold = GoogleFonts.orbitron(
    fontSize: AppFontSize.l,
    color: AppColors.naturalGrey,
    fontWeight: FontWeight.bold,
  );

  static final simpleText = GoogleFonts.orbitron(
    fontSize: AppFontSize.l,
    color: AppColors.naturalGrey,
    fontWeight: FontWeight.normal,
  );

  static final detailTextNormal = GoogleFonts.orbitron(
    fontSize: AppFontSize.m,
    color: AppColors.naturalGrey,
    fontWeight: FontWeight.normal,
  );

  static final detailText500 = GoogleFonts.orbitron(
    fontSize: AppFontSize.m,
    color: AppColors.naturalGrey,
    fontWeight: FontWeight.w500,
  );

  static final detailTextBold = GoogleFonts.orbitron(
    fontSize: AppFontSize.m,
    color: AppColors.naturalGrey,
    fontWeight: FontWeight.bold,
  );
  static final importantTextNormal = GoogleFonts.orbitron(
    fontSize: 18,
    color: AppColors.naturalGrey,
    fontWeight: FontWeight.normal,
  );

  static final importantText500 = GoogleFonts.orbitron(
    fontSize: 18,
    color: AppColors.naturalGrey,
    fontWeight: FontWeight.w500,
  );
}
