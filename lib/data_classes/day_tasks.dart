import 'package:accounting_assistant/data_classes/active_task.dart';

import 'day_task.dart';

// Таски для левой страницы (list_page)
abstract class Days {
  static List<Day> doneDays = [];

  static void fromJson(Map<String, dynamic> json) {
    final days = <DateTime, Day>{};
    json['tasks'].forEach(
      (iterator) {
        final name = iterator['name'] as String;
        final description = iterator['description'] as String;
        final date = DateTime.parse((iterator['date'] as String));
        if (!days.containsKey(date)) {
          days[date] = Day(date: date);
        }
        days[date]!.doneTasks.add(Task(title: name, description: description));
      },
    );
    doneDays.addAll(days.values);
  }

  static Map toJson() {
    List<_DoneTask> tasksEncodeFormat = [];
    for (var day in doneDays) {
      for (var task in day.doneTasks) {
        tasksEncodeFormat.add(_DoneTask(task: task, date: day.date));
      }
    }
    return {"tasks": tasksEncodeFormat};
  }
}

class _DoneTask {
  _DoneTask({required this.task, required this.date});

  Task task;
  DateTime date;

  Map toJson() => {
        "date":
            '${date.year}${date.month >= 10 ? date.month : '0${date.month}'}${date.day >= 10 ? date.day : '0${date.day}'}',
        "name": task.title,
        "description": task.description,
      };
}
