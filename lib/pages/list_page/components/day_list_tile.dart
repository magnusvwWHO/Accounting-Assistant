import 'package:accounting_assistant/data_classes/day_task.dart';
import 'package:flutter/material.dart';

class DayListTile extends StatelessWidget {
  const DayListTile({super.key, required this.day});
  final Day day;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          ("${day.date.day.toString()}.${day.date.month.toString()}"),
          textAlign: TextAlign.start,
        ),
        ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 7.0),
          itemCount: day.doneTasks.length,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () => showTaskAlert(context, index),
            child: Row(
              children: [
                const Icon(Icons.check_circle),
                Text(day.doneTasks[index].title)
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<dynamic> showTaskAlert(BuildContext context, int index) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => AlertDialog(
        title: Text(day.date.toString()),
        content: SingleChildScrollView(
          child: Column(
            children: [
              Text(day.doneTasks[index].title),
              Text(day.doneTasks[index].description),
            ],
          ),
        ),
      ),
    );
  }

  void onTap() {}
}
