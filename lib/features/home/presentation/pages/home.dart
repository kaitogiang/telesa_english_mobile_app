import 'package:flutter/material.dart';
import 'package:telesa_english_app/core/constants/app_color.dart';
import 'package:telesa_english_app/features/home/presentation/widgets/app_container.dart';
import 'package:telesa_english_app/features/home/presentation/widgets/category_section.dart';
import 'package:telesa_english_app/features/home/presentation/widgets/course_progress_card.dart';
import 'package:telesa_english_app/features/home/presentation/widgets/home_header.dart';
import 'package:telesa_english_app/features/home/presentation/widgets/lesson_card.dart';
import 'package:telesa_english_app/features/home/presentation/widgets/quiz_card.dart';
import 'package:telesa_english_app/features/home/presentation/widgets/streak_card.dart';
import 'package:telesa_english_app/features/shared/presentation/widget/discount_banner.dart';
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
          AppSizes.s20.verticalGap,
          AppContainer(
            isOutline: true,
            backgroundColor: AppColors.primaryColor,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                GroupSection(title: 'Keep Moving Forward', child: StreakCard()),
                AppSizes.s10.verticalGap,
                GroupSection(
                  title: 'In Pgrogress',
                  child: QuizCard(
                    backgroundColor: AppColors.deepIndigo,
                    icon: AppAssets.iconsPuzzleIcon.svg(),
                    title: 'Word Puzzle & Vocabulary',
                    questionOnAction: () {},
                    timeOnAction: () {},
                  ),
                ),
                AppSizes.s20.verticalGap,
                QuizCard(
                  icon: AppAssets.iconsRadioIcon.svg(width: 30),
                  title: 'Listening & Pronunciation',
                  questionOnAction: () {},
                  timeOnAction: () {},
                ),
                AppSizes.s20.verticalGap,
                CategorySection(
                  headerTitle: 'English for Kids',
                  onAction: () {},
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List<Widget>.generate(4, (index) {
                        return LessonCard(isShowLevelChip: false);
                      }),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
