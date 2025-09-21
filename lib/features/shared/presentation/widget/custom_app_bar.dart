import 'package:flutter/material.dart';
import 'package:telesa_english_app/core/constants/app_color.dart';
import 'package:telesa_english_app/core/constants/app_text_style.dart';
import 'package:telesa_english_app/telesa_english.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onMenuTap;
  final VoidCallback? onProfileTap;
  final bool isShowBack;

  const CustomAppBar({
    super.key,
    required this.title,
    this.onMenuTap,
    this.onProfileTap,
    this.isShowBack = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: kToolbarHeight, // standard app bar height (56.0)
      color: AppColors.transparent,
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Visibility(
                visible: isShowBack,
                replacement: const SizedBox.shrink(),
                child: IconButton(
                  onPressed: onMenuTap,
                  icon: AppAssets.iconsLeftArrowIcon.svg(
                    width: 20,
                    colorFilter: ColorFilter.mode(
                      AppColors.blackColor.withValues(alpha: .5),
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              _buildHomeAction(),
            ],
          ),
          Positioned.fill(
            child: Center(
              child: Text(
                title,
                style: AppTextStyle.textSize16(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHomeAction() {
    Color iconColor = AppColors.blackColor.withValues(alpha: .5);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          width: 30,
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: AppAssets.iconsSearchIcon.svg(
              width: 30,
              colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
            ),
          ),
        ),
        AppSizes.s8.horizontalGap,
        SizedBox(
          width: 25,
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: AppAssets.iconsBellIcon.svg(
              width: 25,
              colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
            ),
          ),
        ),
      ],
    );
  }

  // This is required by PreferredSizeWidget
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
