import 'package:accounting_assistant/router/pages_list.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomBarProvider extends ChangeNotifier {
  BottomBarProvider({required this.context, required this.navigationShell});

  BuildContext context;
  final StatefulNavigationShell navigationShell;
  final pages = [list, task];

  int currentIndex = 0;

  // int calculateIndex() {
  //   final currentPage = GoRouterState.of(context).matchedLocation;
  //   if (currentPage == list) return 0;
  //   if (currentPage == task) return 1;
  //   return 0;
  // }

  dynamic onTap(int index) {
    currentIndex = index;
    navigationShell.goBranch(index,
        initialLocation: index == navigationShell.currentIndex);
    notifyListeners();
  }
}
