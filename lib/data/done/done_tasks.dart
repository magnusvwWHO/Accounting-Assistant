import 'package:school_accounting_assistant/data/done/entity/done_task.dart';

class DoneTasks {
  List<DoneTask> doneTasks = [];

  Map<String, dynamic> toJson() {
    //TODO Implement JSON encoding
    return {};
  }

  void fromJson(Map<String, dynamic> json) {
    //TODO Implement JSON decoding
  }

  DoneTasks._privateConstructor();
  static final DoneTasks _instance = DoneTasks._privateConstructor();

  factory DoneTasks() {
    return _instance;
  }
}
