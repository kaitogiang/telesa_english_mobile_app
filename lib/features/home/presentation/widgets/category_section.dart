import 'package:flutter/material.dart';
import 'package:telesa_english_app/core/constants/app_color.dart';
import 'package:telesa_english_app/core/constants/app_text_style.dart';
import 'package:telesa_english_app/core/extensions/context_extension.dart';

enum LayoutType { row, grid }

class CategorySection extends StatelessWidget {
  const CategorySection({
    super.key,
    this.layoutType = LayoutType.row,
    required this.headerTitle,
    required this.onAction,
    required this.child,
  });

  final LayoutType layoutType;
  final String headerTitle;
  final VoidCallback onAction;
  final Widget child;

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          headerTitle,
          style: AppTextStyle.textSize16(fontWeight: FontWeight.bold),
        ),
        TextButton(
          onPressed: onAction,
          child: Text(
            context.tr.viewAll,
            style: AppTextStyle.textSize16(
              fontWeight: FontWeight.bold,
              textColor: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeader(context),
        Flexible(child: child),
      ],
    );
  }
}
