import 'package:flutter/material.dart';
import 'package:telesa_english_app/core/constants/app_color.dart';
import 'package:telesa_english_app/core/constants/app_text_style.dart';
import 'package:telesa_english_app/core/extensions/color_extension.dart';
import 'package:telesa_english_app/features/home/domain/entities/streak_day_entity.dart';
import 'package:telesa_english_app/features/shared/presentation/base/widget_view.dart';
import 'package:telesa_english_app/telesa_english.dart';

class StreakCard extends StatefulWidget {
  const StreakCard({super.key});

  @override
  State<StreakCard> createState() => _StreakCardController();
}

class _StreakCardController extends State<StreakCard> {
  final List<StreakDayEntity> weekStreak = [
    StreakDayEntity(dayName: 'Tue', status: StreakStatus.done, dateLabel: '19'),
    StreakDayEntity(dayName: 'Wed', status: StreakStatus.done, dateLabel: '20'),
    StreakDayEntity(
      dayName: 'Thu',
      status: StreakStatus.today,
      dateLabel: '21',
    ),
    StreakDayEntity(
      dayName: 'Fri',
      status: StreakStatus.upcoming,
      dateLabel: '22',
    ),
    StreakDayEntity(
      dayName: 'Sat',
      status: StreakStatus.upcoming,
      dateLabel: '23',
    ),
    StreakDayEntity(
      dayName: 'Sun',
      status: StreakStatus.upcoming,
      dateLabel: '24',
    ),
    StreakDayEntity(
      dayName: 'Mon',
      status: StreakStatus.upcoming,
      dateLabel: '18',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return _StreakCardView(this);
  }
}

class _StreakCardView extends WidgetView<StreakCard, _StreakCardController> {
  const _StreakCardView(super.state, {super.key});

  BoxDecoration? _getDecorationByStatus(StreakStatus status) {
    if (status == StreakStatus.today) {
      return BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(AppSizes.s10),
      );
    }
    return null;
  }

  Widget _buildDayCard({required StreakDayEntity streakDay}) {
    return Container(
      decoration: _getDecorationByStatus(streakDay.status),
      padding: AppSizes.s8.verticalPadding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            streakDay.dayName,
            style: AppTextStyle.textSize16(
              fontWeight: FontWeight.w600,
              textColor: streakDay.status == StreakStatus.today
                  ? AppColors.whiteColor
                  : AppColors.blackColor,
            ),
          ),
          AppSizes.s10.verticalGap,
          Builder(
            builder: (context) {
              switch (streakDay.status) {
                case StreakStatus.done:
                  return Container(
                    padding: EdgeInsets.all(AppSizes.s4),
                    decoration: BoxDecoration(
                      color: AppColors.successColor.toLighter(0.4),
                      shape: BoxShape.circle,
                    ),
                    child: AppAssets.iconsCheckCircleIcon.svg(
                      width: 24,
                      colorFilter: ColorFilter.mode(
                        AppColors.successColor,
                        BlendMode.srcIn,
                      ),
                    ),
                  );
                case StreakStatus.today:
                  return AppAssets.iconsFireIcon.svg(
                    width: 30,
                    colorFilter: ColorFilter.mode(
                      AppColors.flameOrange,
                      BlendMode.srcIn,
                    ),
                  );
                default:
                  return Text(
                    streakDay.dateLabel ?? '',
                    style: AppTextStyle.textSize16(
                      fontWeight: FontWeight.bold,
                      textColor: AppColors.grey,
                    ),
                  );
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: state.weekStreak.map((dayStreak) {
        return Expanded(child: _buildDayCard(streakDay: dayStreak));
      }).toList(),
    );
  }
}
