import 'package:accounting_assistant/data_classes/task.dart';

class ListPageModel {
  ListPageModel({this.title, this.description});

  String? title;
  String? description;
  List<Task> tasks = [];
}
