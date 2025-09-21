import 'package:flutter/material.dart';

class AppColors {
  static Color get whiteColor => Colors.white;

  static Color get blackColor => Colors.black;

  static Color get greenColor => Color(0xFF02EE8B);

  static Color get darkGreenColor => Color(0xFF01C373);

  static Color get lightGreenColor => Color(0xFFDDEBE5);

  static Color get mediumGreenColor => Color(0xFF0EC679);

  static Color get transparent => Colors.transparent;

  static Color get linkColor => Color(0xFF1E90FF);

  static Color get grey => Colors.grey;

  static Color get lightGrey => Colors.grey.shade200;

  static Color get primaryColor => Color(0xFF9C0059);

  static Color get secondaryColor => Color(0xFFFF4FA3);

  static Color get accentColor => Color(0xFF2A74E4);

  static Color get successColor => Color(0xFF22C55E);

  static Color get yellowColor => Color(0xFFED9916);

  static Color get lightBlueGrey => Color(0xFFDCE6EB);

  static Color get darkBlueGrey => Color(0xFF698C92);

  static Color get berryPink => const Color(0xFFAE3A7D);

  static Color get softIndigo => const Color(0xFF9196EB);

  static Color get deepIndigo => const Color(0xFF6E78EB);

  static Color get flameOrange => const Color(0xFFFF6B00);

  static Color darken(Color color, [double amount = .1]) {
    final hsl = HSLColor.fromColor(color);
    return hsl
        .withLightness((hsl.lightness - amount).clamp(0.0, 1.0))
        .toColor();
  }

  static Color lighten(Color color, [double amount = .1]) {
    final hsl = HSLColor.fromColor(color);
    return hsl
        .withLightness((hsl.lightness + amount).clamp(0.0, 1.0))
        .toColor();
  }
}
