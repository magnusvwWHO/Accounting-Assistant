import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomBarProvider extends ChangeNotifier {
  BottomBarProvider({required this.context});

  final BuildContext context;

  int _currentIndex = 0;
  final pages = <String>["/list", "/task"];

  get currentIndex {
    return _currentIndex;
  }

  set currentIndex(dynamic value) {
    _currentIndex = value;
  }

  dynamic onTap(int index) {
    _currentIndex = index;
    GoRouter.of(context).go(pages[_currentIndex]);
    notifyListeners();
  }
}
