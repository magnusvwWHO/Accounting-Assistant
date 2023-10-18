import 'dart:convert';
import 'dart:typed_data';

import 'package:accounting_assistant/data_classes/active_tasks.dart';
import 'package:firebase_storage/firebase_storage.dart';

abstract class TaskLoader {
  static void downloadTasks() async {
    final storageRef = FirebaseStorage.instance
        .ref('gs://school-accounting-assistant.appspot.com');
    final completedTasksReference = storageRef.child("tasks/completed.json");
    final activeTasksReference = storageRef.child("tasks/active.json");

    try {
      final Uint8List? activeRaw = await activeTasksReference.getData();
      if (activeRaw != null) {
        String activeJson = String.fromCharCodes(activeRaw);
        Map<String, dynamic> activeMapped = jsonDecode(activeJson);
        ActiveTasks.fromJson(activeMapped);
      }
    } on FirebaseException catch (e) {
      //TODO Imlement exception notification
    }
    try {
      final Uint8List? completedRaw = await completedTasksReference.getData();
    } on FirebaseException catch (e) {
      //TODO Imlement exception notification
    }
  }
}
