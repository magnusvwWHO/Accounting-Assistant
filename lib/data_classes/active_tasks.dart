import 'package:accounting_assistant/data_classes/active_task.dart';

// Таски для правой страницы (task_page)
class ActiveTasks {
  static final List<ActiveTask> activeTasks = [];

  ActiveTasks.fromJson(Map<String, dynamic> json) {
    json['tasks'].forEach((iterator) {
      final name = iterator['name'] as String;
      final description = iterator['description'] as String;
      activeTasks.add(ActiveTask(title: name, description: description));
    });
  }
}
