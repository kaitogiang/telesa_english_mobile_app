import 'package:flutter/material.dart';
import 'package:telesa_english_app/core/constants/app_color.dart';
import 'package:telesa_english_app/core/constants/app_text_style.dart';
import 'package:telesa_english_app/core/extensions/color_extension.dart';
import 'package:telesa_english_app/telesa_english.dart';

class RatingWithAction extends StatelessWidget {
  const RatingWithAction({
    super.key,
    required this.ratingValue,
    required this.ratingCount,
    required this.onAction,
    required this.actionButtonTitle,
  });

  final String ratingValue;
  final String ratingCount;
  final VoidCallback onAction;
  final String actionButtonTitle;

  Widget rate() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        AppAssets.iconsFilledStarIcon.svg(
          width: 10,
          colorFilter: ColorFilter.mode(AppColors.yellowColor, BlendMode.srcIn),
        ),
        AppSizes.s4.horizontalGap,
        Text(
          '$ratingValue ($ratingCount)',
          style: AppTextStyle.textSize12(
            textColor: AppColors.grey.toDarker(.2),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        rate(),
        GestureDetector(
          onTap: () {
            print('Tap book now');
          },
          child: Text(
            actionButtonTitle,
            style: AppTextStyle.textSize12(
              textColor: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
