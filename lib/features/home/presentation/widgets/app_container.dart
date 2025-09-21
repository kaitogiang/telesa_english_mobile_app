import 'package:flutter/material.dart';
import 'package:telesa_english_app/core/constants/app_color.dart';
import 'package:telesa_english_app/core/extensions/color_extension.dart';
import 'package:telesa_english_app/telesa_english.dart';

class AppContainer extends StatelessWidget {
  const AppContainer({
    super.key,
    required this.child,
    this.isOutline = false,
    this.backgroundColor,
    this.isLinearGradient = false,
  });

  final Widget child;
  final bool isOutline;
  final Color? backgroundColor;
  final bool isLinearGradient;

  BoxDecoration _getBoxDecoration() {
    return BoxDecoration(
      borderRadius: AppSizes.s10.allBorderRadius,
      color: isOutline ? null : backgroundColor ?? AppColors.primaryColor,
      border: isOutline
          ? Border.all(color: AppColors.primaryColor, width: 2)
          : null,
      gradient: !isLinearGradient
          ? null
          : LinearGradient(
              colors: [
                AppColors.primaryColor.toLighter(),
                AppColors.secondaryColor.toLighter(),
              ],
              begin: Alignment.centerLeft,
              end: Alignment(2, 0),
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: AppSizes.s10.allPadding,
      constraints: BoxConstraints(minHeight: AppSizes.s128),
      decoration: _getBoxDecoration(),
      child: child,
    );
  }
}
