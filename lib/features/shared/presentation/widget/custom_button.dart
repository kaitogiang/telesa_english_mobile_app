import 'package:flutter/material.dart';
import 'package:telesa_english_app/core/constants/app_color.dart';
import 'package:telesa_english_app/core/constants/app_sizes.dart';
import 'package:telesa_english_app/core/constants/app_text_style.dart';
import 'package:telesa_english_app/core/extensions/double_extension.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.label,
    this.onPressed,
    this.padding,
    this.backgroundColor,
    this.isShowBorder = false,
    this.textColor,
    this.borderRadius,
    this.width,
    this.height,
    this.textStyle,
  });

  final String label;
  final VoidCallback? onPressed;
  final EdgeInsets? padding;
  final Color? backgroundColor;
  final bool isShowBorder;
  final Color? textColor;
  final double? borderRadius;
  final double? width;
  final double? height;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.whiteColor,
          borderRadius: BorderRadius.circular(borderRadius ?? AppSizes.s4),
          border: !isShowBorder
              ? null
              : Border.all(
                  width: 2,
                  color: AppColors.blackColor.withValues(alpha: .2),
                ),
        ),
        padding: AppSizes.s4.allPadding.copyWith(left: 8, right: 8),
        child: Text(
          label,
          style:
              textStyle ??
              AppTextStyle.textSize14(
                textColor: textColor ?? AppColors.blackColor,
              ),
        ),
      ),
    );
  }
}
