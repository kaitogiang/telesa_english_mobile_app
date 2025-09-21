import 'package:flutter/material.dart';
import 'package:telesa_english_app/core/constants/app_color.dart';
import 'package:telesa_english_app/core/constants/app_sizes.dart';
import 'package:telesa_english_app/core/constants/app_text_style.dart';
import 'package:telesa_english_app/core/constants/generated/assets.gen.dart';
import 'package:telesa_english_app/core/extensions/double_extension.dart';
import 'package:telesa_english_app/features/shared/presentation/widget/app_network_image.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  Widget _buildWelcome() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        ClipOval(
          child: AppNetworkImage(
            width: 50,
            height: 50,
            url:
                '0https://dimensions.edu.vn/public/upload/2025/01/avatar-nobita-cute-1.webp',
          ),
        ),
        AppSizes.s10.horizontalGap,
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Welcome Back,',
              style: AppTextStyle.textSize14(textColor: AppColors.grey),
            ),
            Text(
              'Jobsse Makima',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyle.textSize16(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildHomeAction() {
    Color iconColor = AppColors.blackColor.withValues(alpha: .5);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          onPressed: () {},
          icon: AppAssets.iconsSearchIcon.svg(
            width: 30,
            colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: AppAssets.iconsBellIcon.svg(
            width: 24,
            colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[_buildWelcome(), _buildHomeAction()],
    );
  }
}
