import 'dart:ui';

import 'package:telesa_english_app/core/constants/app_color.dart';

extension ColorExtension on Color {
  Color toDarker([double amount = .1]) {
    return AppColors.darken(this, amount);
  }
}
