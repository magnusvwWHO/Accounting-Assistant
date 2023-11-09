import 'dart:convert';
import 'dart:typed_data';

import 'package:accounting_assistant/data_classes/active_tasks.dart';
import 'package:accounting_assistant/data_classes/day_tasks.dart';
import 'package:firebase_storage/firebase_storage.dart';

abstract class TaskLoader {
  static bool isLoaded = false;

  static Future<String?> initialize() async {
    return await downloadTasks();
  }

  static Future<String?> downloadTasks() async {
    final storageRef = FirebaseStorage.instance.ref();
    final activeTasksReference = storageRef.child("tasks/active.json");
    final completedTasksReference = storageRef.child("tasks/done.json");

    const oneMB = 1024 * 1024;
    try {
      final Uint8List? activeRaw =
          await activeTasksReference.getData(10 * oneMB);
      if (activeRaw != null) {
        String activeJson = utf8.decode(activeRaw);
        Map<String, dynamic> activeMapped = jsonDecode(activeJson);
        ActiveTasks.fromJson(activeMapped);
      }
    } on FirebaseException catch (e) {
      return e.message;
    }
    try {
      final Uint8List? completedRaw =
          await completedTasksReference.getData(10 * oneMB);
      if (completedRaw != null) {
        String completedJson = utf8.decode(completedRaw);
        Map<String, dynamic> completedMapped = jsonDecode(completedJson);
        Days.fromJson(completedMapped);
      }
    } on FirebaseException catch (e) {
      return e.message;
    }
    isLoaded = true;
    return '';
  }

  static void uploadTasks() async {
    final storageRef = FirebaseStorage.instance.ref();

    try {
      await storageRef.child('tasks/active.json').putString(
          jsonEncode(ActiveTasks.toJson()),
          format: PutStringFormat.raw,
          metadata: SettableMetadata(contentType: 'application/json'));
    } on FirebaseException catch (e) {
      //TODO Imlement exception notification
    }

    try {
      await storageRef.child('tasks/done.json').putString(
          jsonEncode(Days.toJson()),
          format: PutStringFormat.raw,
          metadata: SettableMetadata(contentType: 'application/json'));
    } on FirebaseException catch (e) {
      //TODO Imlement exception notification
    }
  }
}
