import 'package:accounting_assistant/data_classes/active_task.dart';
import 'package:flutter/material.dart';
import '../../data_classes/active_tasks.dart';

class TaskPageProvider extends ChangeNotifier {
  TaskPageProvider({required this.context});

  BuildContext context;

  String name = '';
  String description = '';

  var tasks = ActiveTasks.activeTasks;

  var taskSaveFormKey = GlobalKey<FormState>();

  void changed(int index) {
    tasks[index].isDone = !tasks[index].isDone;
    notifyListeners();
  }

  void addTask(String name, String description) {
    ActiveTasks.activeTasks.add(Task(title: name, description: description));
    notifyListeners();
  }
}
