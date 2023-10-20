import 'package:flutter/material.dart';
import '../../data_classes/active_tasks.dart';

class TaskPageProvider extends ChangeNotifier {
  TaskPageProvider({required this.context});

  BuildContext context;
  var tasks = ActiveTasks.activeTasks;

  void open(
      int index) {} // TODO: Implement opening dialog widget with title: title of tasks[index] and description

  void changed(int index) {
    tasks[index].isDone = !tasks[index].isDone;
    notifyListeners();
  }

  void save() {}

  void create() {}
}
