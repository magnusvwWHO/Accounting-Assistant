import 'dart:convert';
import 'dart:typed_data';

import 'package:accounting_assistant/data_classes/active_tasks.dart';
import 'package:accounting_assistant/data_classes/day_tasks.dart';
import 'package:firebase_storage/firebase_storage.dart';

abstract class TaskLoader {
  static void initialize() {
    downloadTasks();
  }

  static void downloadTasks() async {
    final storageRef = FirebaseStorage.instance.ref();
    final activeTasksReference = storageRef.child("tasks/active.json");
    final completedTasksReference = storageRef.child("tasks/done.json");

    const oneMB = 1024 * 1024;
    try {
      final Uint8List? activeRaw =
          await activeTasksReference.getData(10 * oneMB);
      if (activeRaw != null) {
        String activeJson = String.fromCharCodes(activeRaw);
        Map<String, dynamic> activeMapped = jsonDecode(activeJson);
        ActiveTasks.fromJson(activeMapped);
      }
    } on FirebaseException catch (e) {
      //TODO Imlement exception notification
    }
    try {
      final Uint8List? completedRaw =
          await completedTasksReference.getData(10 * oneMB);
      if (completedRaw != null) {
        String completedJson = String.fromCharCodes(completedRaw);
        Map<String, dynamic> completedMapped = jsonDecode(completedJson);
        Days.fromJson(completedMapped);
      }
    } on FirebaseException catch (e) {
      //TODO Imlement exception notification
    }
  }

  static void uploadTasks() async {
    final storageRef = FirebaseStorage.instance.ref();

    String tasksJson = '''{tasks: "test" }''';
    try {
      await storageRef.child('tasks').putString(tasksJson,
          format: PutStringFormat.base64,
          metadata: SettableMetadata(contentType: "application/json"));
    } catch (e) {
      //TODO Imlement exception notification
    }
  }
}
