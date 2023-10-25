import 'package:accounting_assistant/data_classes/day_task.dart';
import 'package:flutter/material.dart';
import '../../data_classes/day_tasks.dart';

class ListPageProvider extends ChangeNotifier {
  ListPageProvider({required this.context});

  BuildContext context;
  final tasks = Days.doneDays;

  void deleteTask(Day day, int index) {
    tasks.where((element) => element == day).single.doneTasks.removeAt(index);
    notifyListeners();
  }

  void onPressed() {}
}
