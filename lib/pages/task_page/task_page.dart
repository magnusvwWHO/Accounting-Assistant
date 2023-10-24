import 'package:accounting_assistant/data_classes/active_task.dart';
import 'package:accounting_assistant/data_classes/task_loader.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'task_page_provider.dart';
import 'package:provider/provider.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext contextMain) {
    final provider = contextMain.watch<TaskPageProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Активные задачи',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 24.0,
          ),
        ),
        leading: const Padding(
          padding: EdgeInsets.only(left: 2.0),
          child: TextButton(
            onPressed:
                TaskLoader.uploadTasks, // TODO: Implement uploading tasks
            child: Icon(
              Icons.save,
              size: 30,
            ),
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(5.0),
        itemCount: provider.tasks.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 10.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              color: Theme.of(context).cardColor,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 2.0,
                  spreadRadius: 1.0,
                  offset: Offset(0.0, 1.0),
                ),
              ],
            ),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 12.0),
                  child: Icon(Icons.circle, size: 12.0),
                ),
                Expanded(
                  child: TextButton(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          provider.tasks[index].title,
                          style: const TextStyle(
                            fontSize: 24.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    onPressed: () =>
                        showTaskAlert(context, provider.tasks[index]),
                    onLongPress: () =>
                        showDeleteAlert(contextMain, provider.tasks[index]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Checkbox(
                    value: provider.tasks[index].isDone,
                    onChanged: (value) => provider.changed(index),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(contextMain).cardColor,
        onPressed: () => showInputAlert(contextMain),
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<dynamic> showDeleteAlert(BuildContext contextMain, Task task) {
    return showDialog(
      context: contextMain,
      barrierDismissible: true,
      builder: (context) => AlertDialog(
        title: Text(
          'Удаление ${task.title}',
          textAlign: TextAlign.start,
          style: const TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: const Text(
          'Вы уверены?',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.w400,
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Theme.of(context).cardColor,
                ),
                onPressed: () => GoRouter.of(context).pop(),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Отмена',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Theme.of(context).cardColor,
                ),
                onPressed: () {
                  contextMain.read<TaskPageProvider>().deleteTask(task);
                  GoRouter.of(context).pop();
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Удалить',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<dynamic> showTaskAlert(BuildContext contextMain, Task task) {
    return showDialog(
      context: contextMain,
      barrierDismissible: true,
      builder: (context) => AlertDialog(
        title: Text(
          task.title,
          textAlign: TextAlign.start,
          style: const TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: SingleChildScrollView(
          child: Text(
            task.description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Theme.of(context).cardColor,
                ),
                onPressed: () {
                  GoRouter.of(context).pop();
                  showEditAlert(contextMain, task);
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Изменить',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Theme.of(context).cardColor,
                ),
                onPressed: () => GoRouter.of(context).pop(),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'ОК',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<dynamic> showEditAlert(BuildContext context, Task task) {
    final provider = context.read<TaskPageProvider>();
    final oldTitle = task.title;
    final oldDesc = task.description;

    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (contextDialog) => AlertDialog(
        title: const Text(
          'Изменение',
          style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
        ),
        content: SizedBox(
          width: 500,
          height: 250,
          child: Form(
            key: provider.taskSaveFormKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: task.title,
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 0.0, style: BorderStyle.none),
                      borderRadius: BorderRadius.circular(13),
                    ),
                    fillColor: Theme.of(context).cardColor,
                    filled: true,
                  ),
                  onSaved: provider.saveName,
                  validator: (value) => provider.validateName(value),
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  minLines: 1,
                  maxLines: 6,
                  decoration: InputDecoration(
                    hintText: task.description,
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 0.0, style: BorderStyle.none),
                      borderRadius: BorderRadius.circular(13),
                    ),
                    fillColor: Theme.of(context).cardColor,
                    filled: true,
                  ),
                  onSaved: provider.saveDescription,
                ),
              ],
            ),
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Theme.of(context).cardColor,
                ),
                onPressed: () => GoRouter.of(context).pop(),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Отмена',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Theme.of(context).cardColor,
                ),
                onPressed: () {
                  if (provider.editTask(oldTitle, oldDesc)) {
                    GoRouter.of(context).pop();
                  }
                }, // TODO: Implement saving changes
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Сохранить',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Future<dynamic> showInputAlert(BuildContext context) {
    final provider = context.read<TaskPageProvider>();

    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (contextDialog) => AlertDialog(
        title: const Row(
          children: [
            Icon(
              Icons.add_circle_outline,
              size: 30,
            ),
            SizedBox(width: 10.0),
            Text(
              'Добавить задачу',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ],
        ),
        content: SizedBox(
          width: 500,
          height: 250,
          child: Form(
            key: provider.taskSaveFormKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Название',
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 0.0, style: BorderStyle.none),
                      borderRadius: BorderRadius.circular(13),
                    ),
                    fillColor: Theme.of(context).cardColor,
                    filled: true,
                  ),
                  onSaved: provider.saveName,
                  validator: (value) => provider.validateName(value),
                  // TODO: Implement validator
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  minLines: 1,
                  maxLines: 6,
                  decoration: InputDecoration(
                    hintText: 'Описание',
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 0.0, style: BorderStyle.none),
                      borderRadius: BorderRadius.circular(13),
                    ),
                    fillColor: Theme.of(context).cardColor,
                    filled: true,
                  ),
                  onSaved: provider.saveDescription,
                ),
              ],
            ),
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Theme.of(context).cardColor,
                ),
                onPressed: () => GoRouter.of(context).pop(),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Отменить',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Theme.of(context).cardColor,
                ),
                onPressed: () {
                  if (provider.addNewTask()) {
                    GoRouter.of(context).pop();
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Сохранить',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
