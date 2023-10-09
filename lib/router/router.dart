import 'package:accounting_assistant/pages/list_page/list_page.dart';
import 'package:accounting_assistant/pages/task_page/task_page.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import '../pages/bottom_bar/bottom_bar.dart';

final _rootNavigationKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final _shellNavigationKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

final router = GoRouter(
  navigatorKey: _rootNavigationKey,
  initialLocation: "/list",
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigationKey,
      builder: (context, state, child) => BottomBar(
        child: child,
      ),
      routes: [
        GoRoute(
          path: '/list',
          builder: (context, state) => const ListPage(),
        ),
        GoRoute(
          path: '/task',
          builder: (context, state) => const TaskPage(),
        ),
      ],
    ),
  ],
);
