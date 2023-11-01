import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:school_accounting_assistant/pages/active/active_page.dart';
import 'package:school_accounting_assistant/pages/active/active_provider.dart';
import 'package:school_accounting_assistant/pages/components/bottom_bar/bottom_bar.dart';
import 'package:school_accounting_assistant/pages/components/bottom_bar/bottom_bar_provider.dart';
import 'package:school_accounting_assistant/pages/done/done_page.dart';
import 'package:school_accounting_assistant/pages/done/done_provider.dart';
import 'package:school_accounting_assistant/pages/loading/loading_page.dart';
import 'package:school_accounting_assistant/pages/loading/loading_provider.dart';
import 'package:school_accounting_assistant/routes/app_pages.dart';

final _rootKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final _shellKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

final router = GoRouter(
  initialLocation: Routes.done,
  navigatorKey: _rootKey,
  routes: [
    /// Страница загрузки
    GoRoute(
      path: Routes.loading,
      pageBuilder: (context, state) => NoTransitionPage(
        child: ChangeNotifierProvider(
          create: (context) => LoadingPageProvider(context: context),
          builder: (context, child) => const LoadingPage(),
        ),
      ),
    ),

    /// Bottom bar
    ShellRoute(
      navigatorKey: _shellKey,
      builder: (context, state, child) => ChangeNotifierProvider(
        create: (context) => BottomBarProvider(context: context),
        child: BottomBar(child: child),
      ),
      routes: [
        /// Страница с выполненными тасками
        GoRoute(
          path: Routes.done,
          name: Routes.done,
          pageBuilder: (context, state) => NoTransitionPage(
            child: ChangeNotifierProvider(
              create: (context) => DonePageProvider(context: context),
              child: const DonePage(),
            ),
          ),
        ),

        /// Страница с активными тасками
        GoRoute(
          path: Routes.active,
          name: Routes.active,
          pageBuilder: (context, state) => NoTransitionPage(
            child: ChangeNotifierProvider(
              create: (context) => ActivePageProvider(context: context),
              child: const ActivePage(),
            ),
          ),
        ),
      ],
    ),
  ],
);
