import 'active_task.dart';

// Модель тасков для левой страницы (list_page)
class Day {
  List<ActiveTask> doneTasks = [];
  DateTime day;

  Day({required this.day});
}
