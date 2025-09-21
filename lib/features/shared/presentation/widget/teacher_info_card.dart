import 'package:flutter/material.dart';
import 'package:telesa_english_app/core/constants/app_color.dart';
import 'package:telesa_english_app/core/constants/app_sizes.dart';
import 'package:telesa_english_app/core/constants/app_text_style.dart';
import 'package:telesa_english_app/core/extensions/color_extension.dart';
import 'package:telesa_english_app/core/extensions/context_extension.dart';
import 'package:telesa_english_app/core/extensions/double_extension.dart';
import 'package:telesa_english_app/core/extensions/string_extension.dart';
import 'package:telesa_english_app/features/shared/presentation/widget/app_network_image.dart';
import 'package:telesa_english_app/features/shared/presentation/widget/base_card.dart';
import 'package:telesa_english_app/features/shared/presentation/widget/rating_with_action.dart';
import 'package:telesa_english_app/features/teacher/domain/teacher_entity.dart';

class TeacherInfoCard extends StatelessWidget {
  const TeacherInfoCard({
    super.key,
    this.isHorizontal = false,
    this.teacherEntity,
  });

  final bool isHorizontal;
  final TeacherEntity? teacherEntity;

  TextStyle _titleStyle() {
    return AppTextStyle.textSize12(
      textColor: AppColors.grey.toDarker(.2),
      fontWeight: FontWeight.w600,
    );
  }

  Widget _skillTag({required Widget icon, required String title}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        icon,
        Text('$title ', style: AppTextStyle.textSize10()),
      ],
    );
  }

  Widget _skillList(List<SkillEntity> skills) {
    return Wrap(
      runSpacing: AppSizes.s4,
      children: List<Widget>.generate(skills.length, (index) {
        return _skillTag(icon: skills[index].icon, title: skills[index].title);
      }),
    );
  }

  Widget _cast(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          '${context.tr.cast}: ',
          style: _titleStyle(),
          overflow: TextOverflow.ellipsis,
        ),
        Expanded(child: Text('${teacherEntity?.price ?? 0}'.formatCurrency())),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      isHorizontal: isHorizontal,
      header: AppNetworkImage(url: teacherEntity?.imageUrl ?? ''),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            teacherEntity?.name ?? '--',
            overflow: TextOverflow.ellipsis,
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
                  text: teacherEntity?.experience ?? '0',
                  style: AppTextStyle.textSize12(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          if (isHorizontal) AppSizes.s2.verticalGap,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('${context.tr.skill}: ', style: _titleStyle()),
              Expanded(child: _skillList(teacherEntity?.skills ?? [])),
            ],
          ),
          if (isHorizontal) AppSizes.s4.verticalGap,
          if (isHorizontal) _cast(context),
          AppSizes.s4.verticalGap,
          RatingWithAction(
            ratingValue: '${teacherEntity?.ratingValue ?? 0}',
            ratingCount: '${teacherEntity?.ratingCount ?? 0}',
            onAction: () {},
            actionButtonTitle: context.tr.bookNow,
          ),
        ],
      ),
    );
  }
}
