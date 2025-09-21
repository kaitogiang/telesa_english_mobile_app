import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:telesa_english_app/core/config/app_event_bus.dart';
import 'package:telesa_english_app/core/events/unfocus_keyboard_event.dart';
import 'package:telesa_english_app/features/home/presentation/pages/home.dart';
import 'package:telesa_english_app/features/shared/presentation/base/main_app_wrapper.dart';
import 'package:telesa_english_app/features/teacher/presentation/pages/teacher.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final mainNavigatorKey = GlobalKey<NavigatorState>();

final goRouterConfig = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: '/home',
  routes: [
    /// Dùng StatefulShellRoute thay cho ShellRoute
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainAppWrapper(child: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/home',
              name: 'home',
              builder: (context, state) => const Home(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/teacher',
              name: 'teacher',
              builder: (context, state) => const Teacher(),
            ),
          ],
        ),
      ],
    ),
  ],
  observers: [CustomObserver()],
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
    print('Remove route');
    super.didRemove(route, previousRoute);
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    print('Replace route');
    AppEventBus().fire(UnfocusKeyboardEvent());
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  }
}
