import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:school_accounting_assistant/routes/app_pages.dart';

class BottomBarProvider extends ChangeNotifier {
  BottomBarProvider({required this.context});

  int currentIndex = 0;

  final pages = [Routes.done, Routes.active];

  BuildContext context;

  changeIndex(int index) {
    currentIndex = index;
    context.go(pages[index]);
    notifyListeners();
  }
}
