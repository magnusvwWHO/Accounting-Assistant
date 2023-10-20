import 'package:flutter/material.dart';
import 'task_page_provider.dart';
import 'package:provider/provider.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<TaskPageProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Активные задачи',
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 24.0,
          ),
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
}
