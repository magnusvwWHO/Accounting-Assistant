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

final router = GoRouter(
  navigatorKey: _rootNavigationKey,
  initialLocation: "/list",
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigationKey,
      builder: (context, state, pageWidget) => ChangeNotifierProvider(
        create: (context) => BottomBarProvider(context: context),
        builder: (context, child) => BottomBar(child: pageWidget),
      ),
      routes: [
        GoRoute(
          name: 'list',
          path: '/list',
          builder: (context, state) => ChangeNotifierProvider(
            create: (context) => ListPageProvider(context: context),
            builder: (context, child) => const ListPage(),
          ),
        ),
        GoRoute(
          name: 'task',
          path: '/task',
          builder: (context, state) => ChangeNotifierProvider(
            create: (context) => TaskPageProvider(context: context),
            builder: (context, child) => const TaskPage(),
          ),
        ),
      ],
    ),
  ],
);
