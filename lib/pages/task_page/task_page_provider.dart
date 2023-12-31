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

  bool editTask(String oldTitle, String oldDescription) {
    if (taskSaveFormKey.currentState!.validate()) {
      taskSaveFormKey.currentState!.save();
      Task task = ActiveTasks.activeTasks
          .where((element) =>
              (element.title == oldTitle) &&
              (element.description == oldDescription))
          .single;
      task.title = name;
      task.description = description;
      notifyListeners();
      return true;
    }
    return false;
  }

  bool addNewTask() {
    if (taskSaveFormKey.currentState!.validate()) {
      taskSaveFormKey.currentState!.save();
      ActiveTasks.activeTasks.add(Task(title: name, description: description));
      notifyListeners();
      return true;
    }
    return false;
  }

  void deleteTask(Task task) {
    tasks.remove(task);
    notifyListeners();
  }

  String? validateName(String? value) {
    notifyListeners();
    return value == '' ? 'Название не может быть пустым' : null;
  }

  void saveName(String? value) => name = value ?? '';

  void saveDescription(String? value) => description = value ?? '';
}
