import 'package:flutter/material.dart';
import 'package:telesa_english_app/core/constants/app_color.dart';
import 'package:telesa_english_app/core/constants/app_sizes.dart';
import 'package:telesa_english_app/core/constants/app_text_style.dart';
import 'package:telesa_english_app/core/extensions/double_extension.dart';

class GroupSection extends StatelessWidget {
  const GroupSection({super.key, required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyle.textSize16(
              fontWeight: FontWeight.bold,
              fontType: TextFontStyle.poppins,
              textColor: AppColors.blackColor.withValues(alpha: .6),
            ),
          ),
          AppSizes.s10.verticalGap,
          child,
        ],
      ),
    );
  }
}
