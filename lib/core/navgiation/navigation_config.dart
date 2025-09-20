import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:telesa_english_app/core/config/app_event_bus.dart';
import 'package:telesa_english_app/core/events/unfocus_keyboard_event.dart';
import 'package:telesa_english_app/features/home/presentation/widgets/app_container.dart';
import 'package:telesa_english_app/features/shared/presentation/base/main_app_wrapper.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final mainNavigatorKey = GlobalKey<NavigatorState>();
final goRouterConfig = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: '/home',
  routes: [
    ShellRoute(
      navigatorKey: mainNavigatorKey,
      builder: (context, state, child) {
        return MainAppWrapper(child: child);
      },
      observers: [CustomObserver()],
      routes: [
        GoRoute(
          path: '/home',
          name: 'home',
          builder: (context, state) {
            return Scaffold(
              body: SafeArea(
                child: Container(
                  color: Colors.green,
                  height: 200,
                  margin: EdgeInsets.only(top: 100),
                  padding: EdgeInsets.all(10),
                  constraints: BoxConstraints(minWidth: double.infinity),
                  child: BannerCard(
                    child: Container(
                      // color: Colors.blue,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    ),
  ],
);

class CustomObserver extends NavigatorObserver {
  @override
  void didPop(Route route, Route? previousRoute) {
    AppEventBus().fire(UnfocusKeyboardEvent());
    super.didPop(route, previousRoute);
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    print('Push new route');
    AppEventBus().fire(UnfocusKeyboardEvent());
    super.didPush(route, previousRoute);
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    print('Push new route');

    super.didRemove(route, previousRoute);
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    print('Push new route');
    AppEventBus().fire(UnfocusKeyboardEvent());
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  }
}
