import 'package:flutter/material.dart';
import 'package:telesa_english_app/core/constants/app_color.dart';
import 'package:telesa_english_app/core/constants/app_text_style.dart';
import 'package:telesa_english_app/telesa_english.dart';

class LessonIndicator extends StatelessWidget {
  final double percent;
  final Color? backgroundColor;

  const LessonIndicator({
    super.key,
    required this.percent,
    this.backgroundColor,
  });

  Color _getIndicatorBackgroundColor() {
    if (backgroundColor == null || backgroundColor == AppColors.primaryColor) {
      return AppColors.berryPink;
    }
    return AppColors.softIndigo;
  }

  Widget _buildProgressIndicator({double percent = 1.0, required Color color}) {
    return FractionallySizedBox(
      widthFactor: percent,
      child: Container(
        height: AppSizes.s8,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(AppSizes.s10),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Lesson 3 of 5',
              style: AppTextStyle.textSize14(textColor: AppColors.whiteColor),
            ),
            Text(
              '${(percent * 100).toStringAsFixed(0)}% Completed',
              style: AppTextStyle.textSize14(textColor: AppColors.whiteColor),
            ),
          ],
        ),
        AppSizes.s8.verticalGap,
        Stack(
          children: [
            _buildProgressIndicator(color: _getIndicatorBackgroundColor()),
            _buildProgressIndicator(
              color: AppColors.whiteColor,
              percent: percent,
            ),
          ],
        ),
      ],
    );
  }
}
