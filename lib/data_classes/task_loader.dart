import 'dart:io';

import 'package:ftpconnect/ftpconnect.dart';
import '../logger/logger.dart';

abstract class TaskLoader {
  static Future<bool> downloadTasks() async {
    FTPConnect ftpConnect =
        FTPConnect("109.194.11.248", user: "magnusvw", pass: "Maximus2004");
    try {
      String fileName = "work/tasks.json";
      await ftpConnect.connect();
      await ftpConnect.downloadFile(
          fileName, File("../../res/json/tasks.json"));
      await ftpConnect.disconnect();
      return true;
    } catch (e) {
      InnerLogger.log(cause: "TaskLoader", isError: true, text: e.toString());
    }
    return false;
  }

  static void uploadTasks() async {}
}
