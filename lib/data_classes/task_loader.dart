import 'dart:convert';
import 'dart:typed_data';

import 'package:accounting_assistant/data_classes/active_tasks.dart';
import 'package:firebase_storage/firebase_storage.dart';

abstract class TaskLoader {
  static void initialize() {
    downloadTasks();
  }

  static void downloadTasks() async {
    final storageRef = FirebaseStorage.instance.ref();
    final activeTasksReference = storageRef.child("tasks/active.json");
    final completedTasksReference = storageRef.child("tasks/done.json");

    //TODO Убрать закачку тасков из main в более подходящее место
    //TODO Исправить архитектуру запросов

    try {
      const oneMB = 1024 * 1024;
      final Uint8List? activeRaw =
          await activeTasksReference.getData(10 * oneMB);
      if (activeRaw != null) {
        String activeJson = String.fromCharCodes(activeRaw);
        Map<String, dynamic> activeMapped = jsonDecode(activeJson);
        ActiveTasks.fromJson(activeMapped);
      }
    } on FirebaseException catch (e) {
      rethrow;
      //TODO Imlement exception notification
    }
    // try {
    //   final Uint8List? completedRaw = await completedTasksReference.getData();
    // } on FirebaseException catch (e) {
    //   //TODO Imlement exception notification
    // }
  }
}
