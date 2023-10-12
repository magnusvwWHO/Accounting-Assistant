import 'package:accounting_assistant/data_classes/date_tasks.dart';
import 'package:flutter/material.dart';

class ListPageProvider extends ChangeNotifier {
  ListPageProvider({required this.context});

  BuildContext context;
  final tasks = DayTasks.dateTasks;
}
