import 'package:flutter/material.dart';
import 'package:telesa_english_app/core/constants/app_color.dart';
import 'package:telesa_english_app/core/constants/app_sizes.dart';
import 'package:telesa_english_app/core/constants/app_text_style.dart';
import 'package:telesa_english_app/core/constants/generated/assets.gen.dart';
import 'package:telesa_english_app/core/extensions/color_extension.dart';
import 'package:telesa_english_app/core/extensions/context_extension.dart';
import 'package:telesa_english_app/core/extensions/double_extension.dart';
import 'package:telesa_english_app/core/extensions/string_extension.dart';
import 'package:telesa_english_app/features/shared/presentation/widget/app_network_image.dart';
import 'package:telesa_english_app/features/shared/presentation/widget/base_card.dart';

class TeacherInfoCard extends StatelessWidget {
  const TeacherInfoCard({super.key, this.isHorizontal = false});

  final bool isHorizontal;

  TextStyle _titleStyle() {
    return AppTextStyle.textSize14(
      textColor: AppColors.grey.toDarker(.2),
      fontWeight: FontWeight.w600,
    );
  }

  Widget _skillTag({required Widget icon, required String title}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        icon,
        Text(title, style: AppTextStyle.textSize12()),
      ],
    );
  }

  Widget _skillList(List<Map> skills) {
    return Wrap(
      runSpacing: AppSizes.s4,
      children: List<Widget>.generate(skills.length, (index) {
        return _skillTag(
          icon: skills[index]['icon'],
          title: skills[index]['title'],
        );
      }),
    );
  }

  Widget _cast(BuildContext context) {
    return Row(
      children: <Widget>[
        Text('${context.tr.cast}: ', style: _titleStyle()),
        Expanded(child: Text('300.000'.formatCurrency())),
      ],
    );
  }

  Widget _rateAndBook(BuildContext context) {
    Widget rate() {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          AppAssets.iconsFilledStarIcon.svg(
            width: 10,
            colorFilter: ColorFilter.mode(
              AppColors.yellowColor,
              BlendMode.srcIn,
            ),
          ),
          AppSizes.s4.horizontalGap,
          Text(
            '4.9 (12)',
            style: AppTextStyle.textSize12(
              textColor: AppColors.grey.toDarker(.2),
            ),
          ),
        ],
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        rate(),
        GestureDetector(
          onTap: () {
            print('Tap book now');
          },
          child: Text(
            context.tr.bookNow,
            style: AppTextStyle.textSize12(
              textColor: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      isHorizontal: isHorizontal,
      header: AppNetworkImage(
        url:
            'https://plus.unsplash.com/premium_photo-1689977927774-401b12d137d6?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8bWFuJTIwYXZhdGFyfGVufDB8fDB8fHww',
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            'Minseo Kim',
            style: AppTextStyle.textSize16(
              fontType: TextFontStyle.poppins,
              fontWeight: FontWeight.w600,
            ),
          ),
          if (isHorizontal) AppSizes.s4.verticalGap,
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '${context.tr.experience}: ',
                  style: _titleStyle(),
                ),
                TextSpan(
                  text: '5 years',
                  style: AppTextStyle.textSize16(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          if (isHorizontal) AppSizes.s2.verticalGap,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('${context.tr.skill}: ', style: _titleStyle()),
              Expanded(
                child: _skillList([
                  {
                    'icon': AppAssets.iconsBookIcon.svg(
                      width: 20,
                      colorFilter: ColorFilter.mode(
                        AppColors.primaryColor,
                        BlendMode.srcIn,
                      ),
                    ),
                    'title': context.tr.reading,
                  },
                  {
                    'icon': AppAssets.iconsSpeakIcon.svg(
                      width: 20,
                      colorFilter: ColorFilter.mode(
                        AppColors.primaryColor,
                        BlendMode.srcIn,
                      ),
                    ),
                    'title': context.tr.speaking,
                  },
                  {
                    'icon': AppAssets.iconsWriteIcon.svg(
                      width: 20,
                      colorFilter: ColorFilter.mode(
                        AppColors.primaryColor,
                        BlendMode.srcIn,
                      ),
                    ),
                    'title': context.tr.writing,
                  },
                ]),
              ),
            ],
          ),
          if (isHorizontal) AppSizes.s4.verticalGap,
          if (isHorizontal) _cast(context),
          AppSizes.s4.verticalGap,
          _rateAndBook(context),
        ],
      ),
    );
  }
}
