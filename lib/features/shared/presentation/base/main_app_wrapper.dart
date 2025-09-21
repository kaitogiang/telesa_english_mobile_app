import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:telesa_english_app/core/config/app_event_bus.dart';
import 'package:telesa_english_app/core/constants/app_color.dart';
import 'package:telesa_english_app/core/constants/app_sizes.dart';
import 'package:telesa_english_app/core/events/unfocus_keyboard_event.dart';
import 'package:telesa_english_app/core/extensions/color_extension.dart';
import 'package:telesa_english_app/core/extensions/double_extension.dart';
import 'package:telesa_english_app/features/shared/data/datasources/native_method.dart';
import 'package:telesa_english_app/features/shared/presentation/base/auto_hide_keyboard.dart';

import 'widget_view.dart';

class MainAppWrapper extends StatefulWidget {
  final Widget child;

  const MainAppWrapper({super.key, required this.child});

  @override
  State<MainAppWrapper> createState() => _MainAppWrapperState();
}

class _MainAppWrapperState extends State<MainAppWrapper> {
  DateTime? duration;
  StreamSubscription? _keyboardSubscription;
  final bottomItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: 'Lesson'),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Teacher'),
    BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Message'),
    BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Account'),
  ];
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();

    // Listen keyboard status
    _keyboardSubscription = AppEventBus().stream<UnfocusKeyboardEvent>().listen(
      (event) {
        if (!mounted) return;
        FocusScope.of(context).unfocus();
      },
    );
  }

  @override
  void dispose() {
    _keyboardSubscription?.cancel();
    super.dispose();
  }

  void _updateSelectedIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _MainAppWrapperView(this);
  }
}

class _MainAppWrapperView
    extends WidgetView<MainAppWrapper, _MainAppWrapperState> {
  const _MainAppWrapperView(super.state);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        bottomNavigationBar: _buildBottomNavigationBar(),
        body: SafeArea(
          child: PopScope(
            canPop: false,
            onPopInvokedWithResult: (didPop, result) async {
              final now = DateTime.now();
              if (state.duration != null &&
                  now.difference(state.duration!).abs().inMilliseconds <= 500) {
                //Just hide the app, not close it
                await NativeMethod.hideAppToBackground();
                state.duration = null;
                return;
              }
              state.duration = now;
              debugPrint('Wait to the next tap');
            },
            child: LoaderOverlay(
              overlayWidgetBuilder: (progress) {
                return Center(
                  child: CircularProgressIndicator(
                    color: AppColors.greenColor.toDarker(0.1),
                  ),
                );
              },
              child: Padding(
                padding: AppSizes.s4.horizontalPadding,
                child: AutoHideKeyboard(child: widget.child),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      onTap: state._updateSelectedIndex,
      currentIndex: state._currentIndex,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: AppColors.blackColor.withValues(alpha: .5),
      showUnselectedLabels: true,
      items: state.bottomItems,
    );
  }
}
