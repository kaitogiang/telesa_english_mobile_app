import 'dart:async';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:telesa_english_app/core/config/app_event_bus.dart';
import 'package:telesa_english_app/core/constants/app_color.dart';
import 'package:telesa_english_app/core/events/unfocus_keyboard_event.dart';
import 'package:telesa_english_app/core/extensions/color_extension.dart';
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
    return PopScope(
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
        child: AutoHideKeyboard(child: widget.child),
      ),
    );
  }
}
