import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../router/pages_list.dart';

class BottomBarProvider extends ChangeNotifier {
  BottomBarProvider({required this.context});

  final BuildContext context;
  final pages = [list, task];

  int currentIndex = 0;

  dynamic onTap(int index) {
    currentIndex = index;
    GoRouter.of(context).go(pages[currentIndex]);
    notifyListeners();
  }
}
