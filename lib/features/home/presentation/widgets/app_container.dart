import 'package:flutter/material.dart';
import 'package:telesa_english_app/core/constants/app_color.dart';
import 'package:telesa_english_app/telesa_english.dart';

class BannerCard extends StatelessWidget {
  const BannerCard({
    super.key,
    required this.child,
    this.isOutline = false,
    this.backgroundColor,
  });

  final Widget child;
  final bool isOutline;
  final Color? backgroundColor;

  BoxDecoration _getBoxDecoration() {
    return BoxDecoration(
      borderRadius: AppSizes.s10.allBorderRadius,
      color: isOutline ? null : backgroundColor ?? AppColors.primaryColor,
      border: isOutline
          ? Border.all(color: AppColors.primaryColor, width: 2)
          : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: AppSizes.s10.allPadding,
      constraints: BoxConstraints(minHeight: AppSizes.s128),
      decoration: _getBoxDecoration(),
      child: child,
    );
  }
}
