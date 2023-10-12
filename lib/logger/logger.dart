import 'dart:io';

abstract class InnerLogger {
  static void log(
      {required String cause,
      required bool isError,
      required String text}) async {
    String currentDate = DateTime.now().toString();
    String error = isError ? "error" : "";
    File file = File("../../logs/$cause-$error-$currentDate.txt");
    await file.create();
    IOSink writer = file.openWrite();
    writer.write(text);
  }
}
