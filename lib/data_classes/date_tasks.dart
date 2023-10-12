import 'date.dart';

abstract class Tasks {
  static List<Date> dateTasks = [];

  bool loadFromJson(String path) {
    return true;
  }

  void uploadToJson(String path) {}
}
