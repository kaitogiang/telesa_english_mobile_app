import 'package:flutter/material.dart';
import 'package:telesa_english_app/features/shared/presentation/widget/custom_app_bar.dart';

class Teacher extends StatelessWidget {
  const Teacher({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: 'Teacher', isShowBack: false));
  }
}
