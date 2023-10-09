import 'package:flutter/material.dart';
import 'list_page_model.dart';

class ListPageProvider extends ChangeNotifier {
  ListPageProvider({required this.context});

  BuildContext context;

  final _models = [
    ListPageModel(title: 'Test task 1'),
    ListPageModel(title: 'Test task 2'),
    ListPageModel(title: 'Test task 3'),
  ];

  get models => _models;

  int length() {
    return _models.length;
  }

  String? title(int index) {
    return _models[index].title;
  }
}
