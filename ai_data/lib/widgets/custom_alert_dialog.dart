import 'package:ai_data/core/app/constants/global_constants.dart';
import 'package:ai_data/core/app/styles/app_border_radius.dart';
import 'package:ai_data/core/app/styles/app_colors.dart';
import 'package:ai_data/core/app/styles/app_space.dart';
import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final List<Widget>? actions;
  final TextStyle? titleStyle;
  final String content;
  final TextStyle? contentStyle;
  final TextAlign? textAlign;
  final bool useOnWillPop;
  final String? imageSrc;
  final Color? imgColor;

  const CustomAlertDialog({
    Key? key,
    required this.title,
    this.actions,
    required this.content,
    this.contentStyle,
    this.titleStyle,
    this.textAlign,
    this.useOnWillPop = true,
    this.imageSrc,
    this.imgColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => useOnWillPop,
      child: Center(
        child: SizedBox.fromSize(
          size: Size(MediaQuery.of(context).size.width, Constants.heightPopup),
          child: AlertDialog(
            backgroundColor: AppColors.darkGrey,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(AppBorderRadius.m),
              ),
            ),
            title: Text(
              title,
              style: titleStyle ?? Theme.of(context).textTheme.displayMedium,
              textAlign: textAlign,
            ),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (imageSrc != null)
                  Padding(
                    padding: const EdgeInsets.only(
                      top: AppSpaces.s,
                    ),
                    child: Center(
                      child: SizedBox(
                        height: AppSpaces.xxxl,
                        width: AppSpaces.xxxl,
                        child: Image(
                          image: AssetImage(
                            imageSrc!,
                          ),
                          color: imgColor,
                        ),
                      ),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: AppSpaces.s,
                  ),
                  child: Text(
                    content,
                    textAlign: textAlign,
                    style: contentStyle,
                  ),
                ),
              ],
            ),
            actionsAlignment: MainAxisAlignment.center,
            actions: actions,
          ),
        ),
      ),
    );
  }
}
