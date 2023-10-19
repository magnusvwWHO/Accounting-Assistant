// Модель таск для правой страницы (task_page)
class Task {
  String title = "";
  String description = "";
  bool isDone = false;

  Task({
    required this.title,
    required this.description,
    this.isDone = false,
  });
}
