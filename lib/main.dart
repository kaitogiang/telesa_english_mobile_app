import 'package:flutter/material.dart';
import 'package:overlay_notification/overlay_notification.dart';
import 'package:telesa_english_app/core/constants/app_color.dart';
import 'package:telesa_english_app/features/shared/presentation/base/widget_view.dart';
import 'package:telesa_english_app/features/shared/presentation/widget/AppNetworkImage.dart';
import 'package:telesa_english_app/features/shared/presentation/widget/base_card.dart';

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
      // child: MaterialApp.router(
      //   title: 'Telesa English',
      //   theme: ThemeData(
      //     colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //     textTheme: GoogleFonts.ralewayTextTheme(),
      //   ),
      //   localizationsDelegates: const [
      //     AppTranslate.delegate,
      //     GlobalMaterialLocalizations.delegate,
      //     GlobalWidgetsLocalizations.delegate,
      //     GlobalCupertinoLocalizations.delegate,
      //   ],
      //   supportedLocales: AppTranslate.delegate.supportedLocales,
      //   locale: state._locale,
      //   routerConfig: goRouterConfig,
      // ),
      child: MaterialApp(
        home: Scaffold(
          body: SafeArea(
            child: BaseCard(
              header: AppNetworkImage(
                url:
                    'https://plus.unsplash.com/premium_photo-1689977927774-401b12d137d6?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8bWFuJTIwYXZhdGFyfGVufDB8fDB8fHww',
              ),
              content: Container(width: 200, height: 100, color: Colors.amber),
            ),
          ),
        ),
      ),
    );
  }
}
