import 'package:flutter/material.dart';
import 'package:telesa_english_app/core/constants/app_color.dart';
import 'package:telesa_english_app/core/constants/app_text_style.dart';
import 'package:telesa_english_app/features/home/presentation/widgets/app_container.dart';
import 'package:telesa_english_app/features/home/presentation/widgets/course_progress_card.dart';
import 'package:telesa_english_app/features/home/presentation/widgets/home_header.dart';
import 'package:telesa_english_app/features/shared/presentation/widget/custom_button.dart';
import 'package:telesa_english_app/features/shared/presentation/widget/group_section.dart';
import 'package:telesa_english_app/telesa_english.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          HomeHeader(),
          DiscountBanner(title: 'Get discounts up to 45% for purchases today'),
          AppSizes.s20.verticalGap,
          GroupSection(title: 'Continue Learning', child: CourseProgressCard()),
        ],
      ),
    );
  }
}

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({super.key, required this.title, this.onAction});

  final String title;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: AppContainer(
            isLinearGradient: true,
            child: LayoutBuilder(
              builder: (context, constraint) {
                return Row(
                  children: [
                    Flexible(
                      flex: 2,
                      child: SizedBox(
                        height: constraint.minHeight,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              title,
                              textAlign: TextAlign.justify,
                              style: AppTextStyle.textSize18(
                                fontWeight: FontWeight.w600,
                                textColor: AppColors.whiteColor,
                                fontType: TextFontStyle.poppins,
                              ),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                            CustomButton(
                              label: 'Explore Class',
                              backgroundColor: AppColors.primaryColor,
                              textColor: AppColors.whiteColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Flexible(flex: 2, child: const SizedBox.shrink()),
                  ],
                );
              },
            ),
          ),
        ),
        //Human image
        Positioned(
          right: 20,
          bottom: 0,
          child: AppAssets.pngHumanImage.image(width: 120),
        ),
      ],
    );
  }
}
