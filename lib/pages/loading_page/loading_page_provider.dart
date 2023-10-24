import 'package:accounting_assistant/data_classes/task_loader.dart';
import 'package:flutter/widgets.dart';

class LoadingPageProvider extends ChangeNotifier {
  LoadingPageProvider({required this.context});

  BuildContext context;

  Future<String?> loadData() async {
    return await TaskLoader.initialize();
  }
}
