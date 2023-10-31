import 'package:school_accounting_assistant/data/done/entity/done_task.dart';

class DoneDay {
  DoneDay({required this.date});

  List<DoneTask> doneTasks = [];
  final DateTime date;
}
