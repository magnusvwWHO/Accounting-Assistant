import 'package:accounting_assistant/data_classes/task.dart';

abstract class Tasks {
  static List<Task> tasks = [];

  bool loadFromJson(String path) {
    return true;
  }

  void uploadToJson(String path) {}
}
