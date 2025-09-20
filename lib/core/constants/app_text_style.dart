import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum TextFontStyle { openSans, poppins }

class AppTextStyle {
  static TextStyle _getTextStyle({
    required double fontSize,
    required FontWeight fontWeight,
    Color textColor = Colors.black,
    TextDecoration decoration = TextDecoration.none,
    double? height,
    double? letterSpacing,
    TextFontStyle fontType = TextFontStyle.openSans,
  }) {
    final baseStyle = TextStyle(
      color: textColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
      decoration: decoration,
      height: height,
      letterSpacing: letterSpacing,
    );

    switch (fontType) {
      case TextFontStyle.poppins:
        return GoogleFonts.poppins(textStyle: baseStyle);
      case TextFontStyle.openSans:
      default:
        return GoogleFonts.openSans(textStyle: baseStyle);
    }
  }

  static TextStyle textSize10({
    Color textColor = Colors.black,
    double fontSize = 10.0,
    FontWeight fontWeight = FontWeight.w400,
    TextDecoration decoration = TextDecoration.none,
    double? height,
    double? letterSpacing,
    TextFontStyle fontType = TextFontStyle.openSans,
  }) =>
      _getTextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        textColor: textColor,
        decoration: decoration,
        height: height,
        letterSpacing: letterSpacing,
        fontType: fontType,
      );

  static TextStyle textSize12({
    Color textColor = Colors.black,
    double fontSize = 12.0,
    FontWeight fontWeight = FontWeight.w400,
    TextDecoration decoration = TextDecoration.none,
    double? height,
    double? letterSpacing,
    TextFontStyle fontType = TextFontStyle.openSans,
  }) =>
      _getTextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        textColor: textColor,
        decoration: decoration,
        height: height,
        letterSpacing: letterSpacing,
        fontType: fontType,
      );

  static TextStyle textSize14({
    Color textColor = Colors.black,
    double fontSize = 14.0,
    FontWeight fontWeight = FontWeight.w400,
    TextDecoration decoration = TextDecoration.none,
    double? height,
    double? letterSpacing,
    TextFontStyle fontType = TextFontStyle.openSans,
  }) =>
      _getTextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        textColor: textColor,
        decoration: decoration,
        height: height,
        letterSpacing: letterSpacing,
        fontType: fontType,
      );

  static TextStyle textSize16({
    Color textColor = Colors.black,
    double fontSize = 16.0,
    FontWeight fontWeight = FontWeight.w400,
    TextDecoration decoration = TextDecoration.none,
    double? height,
    double? letterSpacing,
    TextFontStyle fontType = TextFontStyle.openSans,
  }) =>
      _getTextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        textColor: textColor,
        decoration: decoration,
        height: height,
        letterSpacing: letterSpacing,
        fontType: fontType,
      );

  static TextStyle textSize18({
    Color textColor = Colors.black,
    double fontSize = 18.0,
    FontWeight fontWeight = FontWeight.w500,
    TextDecoration decoration = TextDecoration.none,
    double? height,
    double? letterSpacing,
    TextFontStyle fontType = TextFontStyle.openSans,
  }) =>
      _getTextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        textColor: textColor,
        decoration: decoration,
        height: height,
        letterSpacing: letterSpacing,
        fontType: fontType,
      );

  static TextStyle textSize20({
    Color textColor = Colors.black,
    double fontSize = 20.0,
    FontWeight fontWeight = FontWeight.w500,
    TextDecoration decoration = TextDecoration.none,
    double? height,
    double? letterSpacing,
    TextFontStyle fontType = TextFontStyle.openSans,
  }) =>
      _getTextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        textColor: textColor,
        decoration: decoration,
        height: height,
        letterSpacing: letterSpacing,
        fontType: fontType,
      );

  static TextStyle textSize24({
    Color textColor = Colors.black,
    double fontSize = 24.0,
    FontWeight fontWeight = FontWeight.w600,
    TextDecoration decoration = TextDecoration.none,
    double? height,
    double? letterSpacing,
    TextFontStyle fontType = TextFontStyle.openSans,
  }) =>
      _getTextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        textColor: textColor,
        decoration: decoration,
        height: height,
        letterSpacing: letterSpacing,
        fontType: fontType,
      );

  static TextStyle textSize32({
    Color textColor = Colors.black,
    double fontSize = 32.0,
    FontWeight fontWeight = FontWeight.w700,
    TextDecoration decoration = TextDecoration.none,
    double? height,
    double? letterSpacing,
    TextFontStyle fontType = TextFontStyle.openSans,
  }) =>
      _getTextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        textColor: textColor,
        decoration: decoration,
        height: height,
        letterSpacing: letterSpacing,
        fontType: fontType,
      );

  static TextStyle textSize40({
    Color textColor = Colors.black,
    double fontSize = 40.0,
    FontWeight fontWeight = FontWeight.w700,
    TextDecoration decoration = TextDecoration.none,
    double? height,
    double? letterSpacing,
    TextFontStyle fontType = TextFontStyle.openSans,
  }) =>
      _getTextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        textColor: textColor,
        decoration: decoration,
        height: height,
        letterSpacing: letterSpacing,
        fontType: fontType,
      );
}
