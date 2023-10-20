import 'package:accounting_assistant/data_classes/active_task.dart';

import 'day_task.dart';

// Таски для левой страницы (list_page)
abstract class Days {
  static List<Day> doneDays = [];

  static void fromJson(Map<String, dynamic> json) {
    final days = <DateTime, Day>{};
    json['tasks'].forEach((iterator) {
      final name = iterator['title'] as String;
      final description = iterator['description'] as String;
      final date = DateTime.parse((iterator['date'] as String));
      if (days.containsKey(date)) {
        days[date] = Day(day: date);
      }
      days[date]!.doneTasks.add(Task(title: name, description: description));
    });
  }
}
