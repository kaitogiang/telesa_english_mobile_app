import 'package:flutter/material.dart';
import 'package:telesa_english_app/features/shared/presentation/widget/custom_app_bar.dart';
import 'package:telesa_english_app/features/shared/presentation/widget/teacher_info_card.dart';
import 'package:telesa_english_app/features/teacher/presentation/widget/filter_section.dart';

class Teacher extends StatelessWidget {
  const Teacher({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Teacher', isShowBack: false),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            FilterSection(),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return TeacherInfoCard(isHorizontal: true);
              },
            ),
          ],
        ),
      ),
    );
  }
}
