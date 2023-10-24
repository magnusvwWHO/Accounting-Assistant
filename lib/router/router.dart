import 'package:accounting_assistant/pages/bottom_bar/bottom_bar_provider.dart';
import 'package:accounting_assistant/pages/list_page/list_page.dart';
import 'package:accounting_assistant/pages/list_page/list_page_provider.dart';
import 'package:accounting_assistant/pages/task_page/task_page.dart';
import 'package:accounting_assistant/pages/task_page/task_page_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../pages/bottom_bar/bottom_bar.dart';

final _rootNavigationKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final _shellNavigationKey = GlobalKey<NavigatorState>(debugLabel: 'shell');
final _shellNavigatorListKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellList');
final _shellNavigatorTaskKey =
    GlobalKey<NavigatorState>(debugLabel: 'taskList');

final router = GoRouter(
  navigatorKey: _rootNavigationKey,
  initialLocation: "/list",
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) => ChangeNotifierProvider(
        create: (context) => BottomBarProvider(
            context: context, navigationShell: navigationShell),
        builder: (context, child) => BottomBar(child: navigationShell),
      ),
      branches: [
        StatefulShellBranch(
          navigatorKey: _shellNavigatorListKey,
          routes: [
            GoRoute(
              name: 'list',
              path: '/list',
              pageBuilder: (context, state) => NoTransitionPage(
                child: ChangeNotifierProvider(
                  create: (context) => ListPageProvider(context: context),
                  builder: (context, child) => const ListPage(),
                ),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorTaskKey,
          routes: [
            GoRoute(
              name: 'task',
              path: '/task',
              pageBuilder: (context, state) => NoTransitionPage(
                child: ChangeNotifierProvider(
                  create: (context) => TaskPageProvider(context: context),
                  builder: (context, child) => const TaskPage(),
                ),
              ),
            ),
          ],
        )
      ],
    ),
  ],
);
