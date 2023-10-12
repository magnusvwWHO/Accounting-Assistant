class Task {
  Task(
      {required this.title,
      required this.description,
      required this.date,
      this.isDone = false});

  String title;
  String description;
  String date;
  bool isDone;
}
