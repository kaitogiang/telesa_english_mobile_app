import 'package:flutter/material.dart';
import 'package:telesa_english_app/core/constants/app_color.dart';
import 'package:telesa_english_app/telesa_english.dart';

class BaseCard extends StatelessWidget {
  const BaseCard({
    super.key,
    required this.header,
    required this.content,
    this.isHorizontal = false,
    this.headerHeight,
  });

  final bool isHorizontal;
  final Widget content;
  final Widget header;
  final double? headerHeight;

  BorderRadiusGeometry _getHeaderBorderRadius() {
    final size = Radius.circular(AppSizes.s10);
    final defaultSize = Radius.zero;
    return BorderRadius.only(
      topLeft: size,
      topRight: isHorizontal ? defaultSize : size,
      bottomLeft: isHorizontal ? size : defaultSize,
    );
  }

  BoxConstraints _getBoxConstrains() {
    if (!isHorizontal) {
      return BoxConstraints(maxHeight: 250, maxWidth: 200);
    }

    return BoxConstraints(maxWidth: double.infinity, maxHeight: 160);
  }

  Widget _getContent() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: AppSizes.s8.horizontalPadding,
      color: Colors.red,
      child: content,
    );
  }

  Widget clipHeader() {
    return SizedBox(
      width: isHorizontal ? 200 : double.infinity,
      height: !isHorizontal ? (headerHeight ?? 120) : double.infinity,
      child: Stack(
        children: [
          ClipRRect(borderRadius: _getHeaderBorderRadius(), child: header),
          Positioned(
            top: AppSizes.s8,
            left: AppSizes.s8,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.accentColor.withValues(alpha: 0.2),
                borderRadius: AppSizes.s8.allBorderRadius,
              ),
              padding: AppSizes.s8.allPadding,
              child: AppAssets.iconsBookmarkIcon.svg(
                width: 15,
                colorFilter: ColorFilter.mode(
                  AppColors.whiteColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: _getBoxConstrains(),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: AppSizes.s10.allBorderRadius,
        ),
        child: Builder(
          builder: (context) {
            if (isHorizontal) {
              return Row(
                children: <Widget>[
                  SizedBox(width: 150, child: clipHeader()),
                  Expanded(child: _getContent()),
                ],
              );
            }

            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                clipHeader(),
                Expanded(child: _getContent()),
              ],
            );
          },
        ),
      ),
    );
  }
}
