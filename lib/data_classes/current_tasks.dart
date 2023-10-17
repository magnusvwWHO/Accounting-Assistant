import 'package:accounting_assistant/data_classes/active_task.dart';

// Таски для правой страницы (task_page)
abstract class CurrentTasks {
  List<ActiveTask> currentTasks = [];
}
