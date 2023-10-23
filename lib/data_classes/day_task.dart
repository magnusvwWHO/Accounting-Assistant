import 'active_task.dart';

// Модель тасков для левой страницы (list_page)
class Day {
  List<Task> doneTasks = [];
  DateTime date;

  Day({required this.date});
}
