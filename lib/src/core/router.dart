import 'package:codelitt_calendar/src/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>();

class Router {
  static GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        pageBuilder: (ctx, state, child) =>
            NoTransitionPage(child: CalenderShellScaffoldView(child: child)),
        routes: [
          GoRoute(
            path: RemindersListView.path,
            pageBuilder: (_, __) {
              return const NoTransitionPage(child: RemindersListView());
            },
          ),
          GoRoute(
            path: EditReminderView.path,
            pageBuilder: (_, __) {
              return const NoTransitionPage(child: EditReminderView());
            },
          ),
        ],
      ),
    ],
    errorPageBuilder: (_, state) => MaterialPage(
      key: state.pageKey,
      child: Scaffold(
        body: Center(
          child: Text('No route defined for ${state.name}'),
        ),
      ),
    ),
  );
}
