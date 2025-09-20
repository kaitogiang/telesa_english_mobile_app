import 'package:flutter/cupertino.dart';
import 'package:telesa_english_app/telesa_english.dart';

extension ContextExtension on BuildContext {
  AppTranslate get tr => AppTranslate.of(this);

  double get heightScreen => MediaQuery.of(this).size.height;

  double get widthScreen => MediaQuery.of(this).size.width;
}
