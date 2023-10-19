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
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.blue.shade50,
      ),
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
        backgroundColor: Theme.of(context).primaryColorDark,
        child: const Icon(Icons.save),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
