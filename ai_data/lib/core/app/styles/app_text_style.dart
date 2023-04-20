import 'package:ai_data/core/app/styles/app_colors.dart';
import 'package:ai_data/core/app/styles/app_font_size.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  ///
  /// NEW TEXTSTYLES
  ///
  static final brandStyle = GoogleFonts.satisfy(
    fontSize: AppFontSize.xxl,
    color: AppColors.brandPrimary,
    fontWeight: FontWeight.bold,
  );

  static final titleStyle = GoogleFonts.satisfy(
    fontSize: AppFontSize.l,
    color: AppColors.brandPrimary,
    fontWeight: FontWeight.bold,
  );
  static final simpleTextBold = GoogleFonts.dosis(
    fontSize: AppFontSize.l,
    color: AppColors.brandPrimary,
    fontWeight: FontWeight.bold,
  );

  static final simpleText = GoogleFonts.dosis(
    fontSize: AppFontSize.l,
    color: AppColors.brandPrimary,
    fontWeight: FontWeight.normal,
  );

  static final detailTextNormal = GoogleFonts.dosis(
    fontSize: AppFontSize.m,
    color: AppColors.brandPrimary,
    fontWeight: FontWeight.normal,
  );

  static final detailText500 = GoogleFonts.dosis(
    fontSize: AppFontSize.m,
    color: AppColors.brandPrimary,
    fontWeight: FontWeight.w500,
  );

  static final detailTextBold = GoogleFonts.dosis(
    fontSize: AppFontSize.m,
    color: AppColors.brandPrimary,
    fontWeight: FontWeight.bold,
  );
  static final importantTextNormal = GoogleFonts.montserrat(
    fontSize: 18,
    color: AppColors.brandPrimary,
    fontWeight: FontWeight.normal,
  );

  static final importantText500 = GoogleFonts.montserrat(
    fontSize: 18,
    color: AppColors.brandPrimary,
    fontWeight: FontWeight.w500,
  );
}
