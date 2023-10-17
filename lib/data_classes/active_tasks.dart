import 'package:accounting_assistant/data_classes/active_task.dart';

// Таски для правой страницы (task_page)
class CurrentTasks {
  //HARDCODE
  static List<ActiveTask> currentTasks = [
    ActiveTask(title: 'First', description: 'First test active task'),
    ActiveTask(title: 'Second', description: 'Second test active task'),
    ActiveTask(title: 'Third', description: 'Third test active task'),
  ];
}
