import 'package:flutter/material.dart';
import 'package:telesa_english_app/core/constants/app_color.dart';
import 'package:telesa_english_app/core/constants/app_sizes.dart';
import 'package:telesa_english_app/core/constants/app_text_style.dart';
import 'package:telesa_english_app/core/extensions/double_extension.dart';
import 'package:telesa_english_app/features/shared/presentation/widget/custom_button.dart';

class BookTeacherDialog extends StatelessWidget {
  const BookTeacherDialog({super.key});

  @override
  Widget build(BuildContext context) {
    // return IntrinsicHeight(
    //   child: Row(
    //     children: [
    //       DateSelectorItem(
    //         dayName: 'Thu',
    //         dayValue: '04',
    //         slot: 0,
    //         isBooked: true,
    //       ),
    //       DateSelectorItem(dayName: 'Thu', dayValue: '04', slot: 3),
    //       DateSelectorItem(
    //         dayName: 'Thu',
    //         dayValue: '04',
    //         slot: 4,
    //         isSelected: true,
    //       ),
    //     ],
    //   ),
    // );
    return StatusLegend();
  }
}

class DateSelectorItem extends StatelessWidget {
  const DateSelectorItem({
    super.key,
    required this.dayName,
    required this.dayValue,
    required this.slot,
    this.isSelected = false,
    this.isBooked = false,
  });

  final String dayName;
  final String dayValue;
  final int slot;
  final bool isSelected;
  final bool isBooked;

  BoxDecoration _getDecoration() {
    if (isSelected) {
      return BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: AppSizes.s10.allBorderRadius,
      );
    }
    if (isBooked) {
      return BoxDecoration(
        color: AppColors.blackColor.withValues(alpha: 0.07),
        borderRadius: AppSizes.s10.allBorderRadius,
      );
    }

    return BoxDecoration(
      borderRadius: AppSizes.s10.allBorderRadius,
      border: Border.all(
        color: AppColors.blackColor.withValues(alpha: .2),
        width: 2,
      ),
    );
  }

  Color _getColor() {
    return isSelected
        ? AppColors.whiteColor
        : isBooked
        ? AppColors.blackColor.withValues(alpha: .5)
        : AppColors.blackColor;
  }

  Color _getIconSlotColor() {
    return isSelected && slot > 0
        ? AppColors.successColor
        : slot > 0
        ? AppColors.blackColor.withValues(alpha: .2)
        : AppColors.transparent;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 78,
      padding: EdgeInsets.symmetric(vertical: AppSizes.s16),
      decoration: _getDecoration(),
      child: Column(
        children: <Widget>[
          Text(dayName, style: AppTextStyle.textSize14(textColor: _getColor())),
          Text(
            dayValue,
            style: AppTextStyle.textSize16(
              textColor: _getColor(),
              fontWeight: FontWeight.bold,
            ),
          ),
          if (slot == 0) AppSizes.s10.verticalGap,
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (slot > 0)
                CircleAvatar(backgroundColor: _getIconSlotColor(), radius: 4.0),
              if (slot > 0) AppSizes.s4.horizontalGap,
              if (slot > 0)
                Text(
                  '$slot slot',
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.textSize12(textColor: _getColor()),
                ),
              if (slot == 0)
                Container(width: 5, height: 2, color: AppColors.blackColor),
            ],
          ),
        ],
      ),
    );
  }
}

class TimeSelector extends StatelessWidget {
  const TimeSelector({super.key});

  Widget _buildCardByStatus({
    required String title,
    bool isSelected = false,
    bool isBooked = false,
  }) {
    Color? textColor;
    Color? backgroundColor;
    if (isSelected) {
      textColor = AppColors.whiteColor;
      backgroundColor = AppColors.primaryColor;
    } else if (isBooked) {
      textColor = AppColors.blackColor.withValues(alpha: .5);
      backgroundColor = AppColors.blackColor.withValues(alpha: 0.04);
    }
    return CustomButton(
      label: title,
      isShowBorder: !isSelected && !isBooked,
      backgroundColor: backgroundColor,
      textColor: textColor,
      borderRadius: AppSizes.s8,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _buildCardByStatus(title: '08:00 am', isSelected: true),
          _buildCardByStatus(title: '09:00 am', isBooked: true),
          _buildCardByStatus(title: '10:00 am'),
          _buildCardByStatus(title: '11:00 am'),
          _buildCardByStatus(title: '01:00 pm', isBooked: true),
          _buildCardByStatus(title: '02:00 pm', isSelected: true),
          _buildCardByStatus(title: '03:00 pm'),
        ],
      ),
    );
  }
}

class StatusLegend extends StatelessWidget {
  const StatusLegend({super.key});

  Widget _buildItem({
    required Color color,
    required String title,
    bool isShowBorder = false,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: !isShowBorder ? color : null,
            shape: BoxShape.circle,
            border: !isShowBorder ? null : Border.all(color: color, width: 2),
          ),
        ),
        AppSizes.s8.horizontalGap,
        Text(title, style: AppTextStyle.textSize14()),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _buildItem(
          color: AppColors.blackColor.withValues(alpha: .2),
          isShowBorder: true,
          title: 'Available',
        ),
        AppSizes.s8.horizontalGap,
        _buildItem(
          color: AppColors.blackColor.withValues(alpha: .2),
          title: 'Booked',
        ),
        AppSizes.s8.horizontalGap,
        _buildItem(color: AppColors.primaryColor, title: 'Selected'),
      ],
    );
  }
}

// class DurationSlot extends StatelessWidget {
//   const DurationSlot({super.key});
//
//   @override
//   Widget build(BuildContext context) {}
// }
