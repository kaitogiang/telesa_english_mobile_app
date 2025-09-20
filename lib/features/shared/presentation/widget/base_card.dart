import 'package:flutter/material.dart';
import 'package:telesa_english_app/core/constants/app_sizes.dart';
import 'package:telesa_english_app/core/extensions/double_extension.dart';

class BaseCard extends StatelessWidget {
  const BaseCard({
    super.key,
    required this.header,
    required this.content,
    this.isHorizontal = false,
  });

  final bool isHorizontal;
  final Widget content;
  final Widget header;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: AppSizes.s10.allBorderRadius),
      child: Builder(
        builder: (context) {
          if (isHorizontal) {
            return Row(
              children: <Widget>[
                header,
                Expanded(child: content),
              ],
            );
          }

          return Column(
            children: <Widget>[
              header,
              Expanded(child: content),
            ],
          );
        },
      ),
    );
  }
}
