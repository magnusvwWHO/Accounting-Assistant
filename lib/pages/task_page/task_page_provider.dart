import 'package:flutter/material.dart';
import '../../data_classes/active_tasks.dart';

class TaskPageProvider extends ChangeNotifier {
  TaskPageProvider({required this.context});

  BuildContext context;
  var tasks = ActiveTasks.activeTasks;

  void changed(int index) {
    tasks[index].isDone = !tasks[index].isDone;
    notifyListeners();
  }

  void pressed() {}
}
