class Task {
  Task(
      {required this.title,
      required this.description,
      required this.date,
      this.isDone = false});

  String title;
  String description;
  DateTime date;
  bool isDone;
}
