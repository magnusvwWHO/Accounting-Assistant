import 'package:school_accounting_assistant/data/entity/task.dart';

class ActiveTask extends Task {
  ActiveTask({
    required super.title,
    required super.description,
    this.isDone = false,
  });

  bool isDone;

  Map<String, dynamic> toJson() {
    return {};
    //TODO Implement JSON encoding
  }
}
