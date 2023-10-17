// Модель таск для правой страницы (task_page)
class ActiveTask {
  String title = "";
  String description = "";
  bool isDone = false;

  ActiveTask({
    required this.title,
    required this.description,
    this.isDone = false,
  });
}
