import 'package:flutter/material.dart';
import '../../data_classes/day_tasks.dart';

class ListPageProvider extends ChangeNotifier {
  ListPageProvider({required this.context});

  BuildContext context;
  final tasks = Days.days;

  void onPressed() {}
}
