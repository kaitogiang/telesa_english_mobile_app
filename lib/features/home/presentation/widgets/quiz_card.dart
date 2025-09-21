import 'package:flutter/material.dart';
import 'package:telesa_english_app/core/constants/app_color.dart';
import 'package:telesa_english_app/core/constants/app_sizes.dart';
import 'package:telesa_english_app/core/constants/app_text_style.dart';
import 'package:telesa_english_app/core/extensions/color_extension.dart';
import 'package:telesa_english_app/core/extensions/context_extension.dart';
import 'package:telesa_english_app/core/extensions/double_extension.dart';
import 'package:telesa_english_app/features/home/presentation/widgets/app_container.dart';
import 'package:telesa_english_app/features/shared/presentation/widget/CustomButton.dart';

class QuizCard extends StatelessWidget {
  const QuizCard({
    super.key,
    required this.icon,
    required this.title,
    required this.questionOnAction,
    required this.timeOnAction,
    this.backgroundColor,
  });

  final Widget icon;
  final String title;
  final VoidCallback timeOnAction;
  final VoidCallback questionOnAction;
  final Color? backgroundColor;

  Widget _buildScore(BuildContext context, int score) {
    return Container(
      padding: AppSizes.s8.verticalPadding.copyWith(left: 1, right: 1),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: AppSizes.s8.allBorderRadius,
      ),
      child: Column(
        children: <Widget>[
          Text(
            '$score/10',
            style: AppTextStyle.textSize16(fontWeight: FontWeight.bold),
          ),
          Text(
            context.tr.yourScore,
            style: AppTextStyle.textSize14(
              textColor: AppColors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLeftIcon(BuildContext context, Widget icon) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        icon,
        Text(
          context.tr.quiz,
          style: AppTextStyle.textSize16(
            textColor: AppColors.grey.toLighter(.2),
          ),
        ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _buildLeftIcon(context, icon),
        _buildScore(context, 3),
      ],
    );
  }

  Widget _buildTitle() {
    return Text(
      title,
      overflow: TextOverflow.ellipsis,
      style: AppTextStyle.textSize16(
        textColor: AppColors.whiteColor,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildActionButton(BuildContext context) {
    return Row(
      children: <Widget>[
        CustomButton(label: context.tr.minutes10),
        AppSizes.s8.horizontalGap,
        CustomButton(label: context.tr.questions10),
      ],
    );
  }

  Widget _buildProgressIndicator({double percent = 1.0, required Color color}) {
    return FractionallySizedBox(
      widthFactor: percent,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(AppSizes.s10),
        ),
        height: AppSizes.s8,
      ),
    );
  }

  Color _getIndicatorBackgroundColor() {
    if (backgroundColor == null || backgroundColor == AppColors.primaryColor) {
      return AppColors.berryPink;
    }

    return AppColors.softIndigo;
  }

  Widget _buildLessonIndicator([double percent = .3]) {
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

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      backgroundColor: backgroundColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          AppSizes.s8.verticalGap,
          _buildTitle(),
          AppSizes.s8.verticalGap,
          _buildActionButton(context),
          AppSizes.s16.verticalGap,
          _buildLessonIndicator(),
        ],
      ),
    );
  }
}
