import 'package:flutter/material.dart';
import 'package:telesa_english_app/core/constants/app_color.dart';
import 'package:telesa_english_app/core/constants/app_sizes.dart';
import 'package:telesa_english_app/core/constants/generated/assets.gen.dart';
import 'package:telesa_english_app/features/teacher/presentation/widget/custom_filter.dart';

class FilterSection extends StatelessWidget {
  const FilterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppAssets.iconsFilterIcon.svg(width: 30),
        Expanded(
          child: Wrap(
            runSpacing: AppSizes.s4,
            spacing: AppSizes.s4,
            children: <Widget>[
              CustomFilter(
                options: <String>[
                  'All Levels',
                  'Speaking',
                  'Listening',
                  'Reading',
                ],
              ),
              CustomFilter(
                options: <String>[
                  '100.000 - 200.000/h',
                  '200.000 - 400.000/h',
                  '400.000 - 600.000/h',
                  '600.000 - 800.000/h',
                  '800.000 - 1.000.000/h',
                ],
              ),
              CustomFilter(
                options: [],
                customAction: (dateNotifier) {},
                trailingIcon: AppAssets.iconsScheduleIcon.svg(
                  width: 20,
                  colorFilter: ColorFilter.mode(
                    AppColors.blackColor.withValues(alpha: .5),
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
