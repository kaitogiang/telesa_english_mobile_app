import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:overlay_notification/overlay_notification.dart';
import 'package:telesa_english_app/core/constants/app_color.dart';
import 'package:telesa_english_app/core/navgiation/navigation_config.dart';
import 'package:telesa_english_app/features/shared/presentation/base/widget_view.dart';
import 'package:telesa_english_app/telesa_english.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _MyAppView(this);
  }
}

class _MyAppView extends WidgetView<MyApp, _MyAppState> {
  const _MyAppView(super.state);

  @override
  Widget build(BuildContext context) {
    return OverlayNotification.global(
      toastTheme: ToastThemeData(
        background: AppColors.lightGrey,
        textColor: AppColors.blackColor,
      ),
      child: MaterialApp.router(
        title: 'Telesa English',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          textTheme: GoogleFonts.ralewayTextTheme(),
        ),
        localizationsDelegates: const [
          AppTranslate.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppTranslate.delegate.supportedLocales,
        locale: state._locale,
        routerConfig: goRouterConfig,
      ),
      // child: MaterialApp(
      //   localizationsDelegates: const [
      //     AppTranslate.delegate,
      //     GlobalMaterialLocalizations.delegate,
      //     GlobalWidgetsLocalizations.delegate,
      //     GlobalCupertinoLocalizations.delegate,
      //   ],
      //   supportedLocales: AppTranslate.delegate.supportedLocales,
      //   locale: state._locale,
      //   home: AnnotatedRegion<SystemUiOverlayStyle>(
      //     value: SystemUiOverlayStyle(
      //       statusBarColor: Colors.white,
      //       statusBarIconBrightness: Brightness.dark,
      //     ),
      //     child: Scaffold(
      //       backgroundColor: AppColors.whiteColor,
      //       body: SafeArea(
      //         child: Padding(
      //           padding: AppSizes.s8.horizontalPadding,
      //           child: Home(),
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
