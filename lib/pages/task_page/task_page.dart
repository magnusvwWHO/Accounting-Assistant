import 'package:flutter/material.dart';
import 'task_page_provider.dart';
import 'package:provider/provider.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<TaskPageProvider>();

    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        itemCount: provider.tasks.length,
        itemBuilder: (context, index) => CheckboxListTile(
          title: Text(
            provider.tasks[index].title,
            style: const TextStyle(fontSize: 24.0),
          ),
          value: provider.tasks[index].isDone,
          onChanged: (value) => provider.changed(index),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlue,
        child: const Icon(Icons.save),
        onPressed: () {},
      ),
    );
  }
}
