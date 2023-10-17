import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';

abstract class TaskLoader {
  static void downloadTasks() async {
    final storageRef = FirebaseStorage.instance.ref();
    final completedTasksReference = storageRef.child("tasks/completed.json");
    final activeTasksReference = storageRef.child("tasks/active.json");

    try {
      final Uint8List? completedJson = await completedTasksReference.getData();
      final Uint8List? activeJson = await activeTasksReference.getData();
    } on FirebaseException catch (e) {
      //TODO Imlement exception notification
    }
  }
}
