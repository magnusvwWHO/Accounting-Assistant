import 'package:school_accounting_assistant/data/entity/task.dart';

class DoneTask extends Task {
  DoneTask({
    required super.title,
    required super.description,
    this.date,
  });

  DateTime? date;

  Map<String, dynamic> toJson() {
    return {};
    //TODO Implement JSON encoding
  }
}
