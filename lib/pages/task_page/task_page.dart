import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'task_page_provider.dart';
import 'package:provider/provider.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<TaskPageProvider>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        title: const Text(
          'Активные задачи',
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 24.0,
          ),
        ),
        leading: TextButton(
          child: const Icon(
            Icons.add,
            size: 30,
          ),
          onPressed: () => showInputAlert(context),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(5.0),
        itemCount: provider.tasks.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextButton(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          provider.tasks[index].title,
                          style: const TextStyle(fontSize: 24.0),
                        ),
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
                Checkbox(
                  value: provider.tasks[index].isDone,
                  onChanged: (value) => provider.changed(index),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> showInputAlert(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (contextDialog) => AlertDialog(
        title: const Row(
          children: [
            Icon(
              Icons.add_circle,
              size: 30,
            ),
            Text(
              'Добавить задачу',
            ),
          ],
        ),
        content: SizedBox(
          width: 500,
          height: 500,
          child: Form(
            key: context.read<TaskPageProvider>().taskSaveFormKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Название'),
                  onSaved: context.read<TaskPageProvider>().saveName,
                ),
                TextFormField(
                  minLines: 1,
                  maxLines: 8,
                  decoration: const InputDecoration(hintText: 'Описание'),
                  onSaved: context.read<TaskPageProvider>().saveDescription,
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
                  backgroundColor: Colors.blue[100],
                ),
                onPressed: () => GoRouter.of(context).pop(),
                child: const Text(
                  'Отменить',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue[100],
                ),
                onPressed: () {
                  context.read<TaskPageProvider>().addNewTask();
                  GoRouter.of(context).pop();
                },
                child: const Text(
                  'Сохранить',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
