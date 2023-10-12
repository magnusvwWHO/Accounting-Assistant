import 'package:accounting_assistant/data_classes/tasks.dart';
import 'package:flutter/material.dart';

class ListPageProvider extends ChangeNotifier {
  ListPageProvider({required this.context});

  BuildContext context;
  final tasks = Tasks.tasks;

  void Function()? onPressed;
}
