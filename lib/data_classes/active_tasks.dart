import 'package:accounting_assistant/data_classes/active_task.dart';

// Таски для правой страницы (task_page)
abstract class ActiveTasks {
  static final List<Task> activeTasks = [];

  static void fromJson(Map<String, dynamic> json) {
    json['tasks'].forEach((iterator) {
      final name = iterator['name'] as String;
      final description = iterator['description'] as String;
      activeTasks.add(Task(title: name, description: description));
    });
  }

  static Map toJson() {
    return {"tasks": activeTasks};
  }
}
