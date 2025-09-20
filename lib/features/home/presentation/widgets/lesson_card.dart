import 'package:flutter/material.dart';
import 'package:telesa_english_app/core/constants/app_color.dart';
import 'package:telesa_english_app/core/constants/app_text_style.dart';
import 'package:telesa_english_app/core/extensions/context_extension.dart';
import 'package:telesa_english_app/features/shared/presentation/widget/app_network_image.dart';
import 'package:telesa_english_app/features/shared/presentation/widget/base_card.dart';
import 'package:telesa_english_app/features/shared/presentation/widget/rating_with_action.dart';
import 'package:telesa_english_app/telesa_english.dart';

class LessonCard extends StatelessWidget {
  const LessonCard({super.key, this.isShowLevelChip = true});

  final bool isShowLevelChip;

  Widget _buildLevelChip(String title) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: AppSizes.s4.allBorderRadius,
        color: AppColors.lightBlueGrey,
      ),
      padding: AppSizes.s4.allPadding,
      child: Text(
        title,
        style: AppTextStyle.textSize12(
          textColor: AppColors.darkBlueGrey,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildDuration(String date) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        AppAssets.iconsClockOutlineIcon.svg(
          width: 13,
          colorFilter: ColorFilter.mode(AppColors.grey, BlendMode.srcIn),
        ),
        AppSizes.s4.horizontalGap,
        Text(date, style: AppTextStyle.textSize12(textColor: AppColors.grey)),
      ],
    );
  }

  Widget _buildLessonName(String name) {
    return Text(
      name,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
      style: AppTextStyle.textSize16(fontWeight: FontWeight.w600),
    );
  }

  Widget _buildLessonDesc(String desc) {
    return Text(
      desc,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
      style: AppTextStyle.textSize12(textColor: AppColors.grey),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      headerHeight: 100,
      header: AppNetworkImage(
        url:
            'https://plus.unsplash.com/premium_photo-1689977927774-401b12d137d6?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8bWFuJTIwYXZhdGFyfGVufDB8fDB8fHww',
      ),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          AppSizes.s4.verticalGap,
          Builder(
            builder: (context) {
              if (!isShowLevelChip) return const SizedBox.shrink();
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _buildLevelChip('Advance'),
                  _buildDuration('21:55:31'),
                ],
              );
            },
          ),
          AppSizes.s4.verticalGap,
          _buildLessonName('Practical English for Work & Life'),
          _buildLessonDesc('Learn basic vocabulary and common phrases'),
          RatingWithAction(
            ratingValue: '4.6',
            ratingCount: '12',
            onAction: () {},
            actionButtonTitle: context.tr.seeMore,
          ),
        ],
      ),
    );
  }
}
