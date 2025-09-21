import 'package:flutter/material.dart';
import 'package:telesa_english_app/core/constants/app_color.dart';
import 'package:telesa_english_app/core/constants/app_sizes.dart';
import 'package:telesa_english_app/core/constants/app_text_style.dart';
import 'package:telesa_english_app/core/constants/generated/assets.gen.dart';
import 'package:telesa_english_app/core/extensions/double_extension.dart';
import 'package:telesa_english_app/features/home/presentation/widgets/app_container.dart';
import 'package:telesa_english_app/features/home/presentation/widgets/lesson_indicator.dart';
import 'package:telesa_english_app/features/shared/presentation/widget/custom_button.dart';

class CourseProgressCard extends StatelessWidget {
  const CourseProgressCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      backgroundColor: AppColors.accentColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: [
              AppAssets.pngHumBookImage.image(width: 60, height: 60),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Practical English for Work & Life',
                      style: AppTextStyle.textSize16(
                        fontWeight: FontWeight.bold,
                        textColor: AppColors.whiteColor,
                      ),
                    ),
                    Text(
                      'Learn basic vocabulary and common phrases',
                      style: AppTextStyle.textSize14(
                        textColor: AppColors.whiteColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Flexible(
                flex: 4,
                child: LessonIndicator(
                  percent: .3,
                  backgroundColor: AppColors.accentColor,
                ),
              ),
              AppSizes.s10.horizontalGap,
              Flexible(
                flex: 2,
                child: CustomButton(
                  label: 'Continue',
                  width: double.infinity,
                  height: 35,
                  borderRadius: AppSizes.s10,
                  textStyle: AppTextStyle.textSize14(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
