import 'package:accounting_assistant/data_classes/day_tasks.dart';
import 'package:accounting_assistant/pages/list_page/components/day_list_tile.dart';
import 'package:accounting_assistant/pages/list_page/list_page_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ListPageProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Выполненные задачи',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 24.0,
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 2.0),
          child: TextButton(
            onPressed: () {},
            child: const Icon(
              Icons.update_rounded,
              size: 30.0,
            ),
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(4.0),
        itemCount: Days.doneDays.length,
        itemBuilder: (context, index) {
          return DayListTile(day: provider.tasks[index]);
        },
      ),
    );
  }
}
