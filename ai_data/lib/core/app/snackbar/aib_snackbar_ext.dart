/*import 'package:ai_data/core/app/styles/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

extension ShowSnackBar on BuildContext {
  void showErrorSnackBar({required String? message}) {
    _showSnackbar(
      message: message ?? 'snackbar.error'.tr(),
      icon: Icons.error,
      mainColor: AppColors.naturalGrey,
      backgroundColor: AppColors.actionError,
    );
  }

  void _showSnackbar({
    required String message,
    required IconData icon,
    required Color mainColor,
    required Color backgroundColor,
  }) {
    final overlay = Overlay.of(this);
    final mQuery = MediaQuery.of(this).size.height;

    AnimationController? controller;

    showTopSnackBar(
      overlay,
      AIBSnackbar(
        message: message,
        icon: icon,
        mainColor: mainColor,
        backgroundColor: backgroundColor,
        dismiss: () {
          if (controller?.status != AnimationStatus.dismissed) {
            controller?.reverse();
          }
        },
      ),
      padding: EdgeInsets.only(
        top: mQuery - (mQuery * 0.29),
        left: AppSpaces.m,
        right: AppSpaces.m,
      ),
      displayDuration: SnackbarConstants.snackbarDuration,
      animationDuration: Duration.zero,
      reverseAnimationDuration: Duration.zero,
      onAnimationControllerInit: (snackbarController) {
        controller = snackbarController;
      },
    );
  }
}
*/