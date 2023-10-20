import 'package:accounting_assistant/data_classes/day_task.dart';
import 'package:flutter/material.dart';

class DayListTile extends StatelessWidget {
  const DayListTile({super.key, required this.day});
  final Day day;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          ("${day.date.day}.${day.date.month}.${day.date.year}"),
          textAlign: TextAlign.start,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 7.0),
          itemCount: day.doneTasks.length,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () => showTaskAlert(context, index),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 5.0),
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.blue[50],
              ),
              child: Row(
                children: [
                  const SizedBox(width: 5),
                  const Icon(
                    Icons.check_circle,
                    size: 30,
                  ),
                  Expanded(
                    child: Text(
                      day.doneTasks[index].title,
                      style: const TextStyle(fontSize: 25),
                    ),
                  ),
                ],
              ),
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
        title: Text(
          '${day.date.day}.${day.date.month}.${day.date.year}',
          style: const TextStyle(fontSize: 30),
          textAlign: TextAlign.center,
        ),
        content: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                day.doneTasks[index].title,
                style: const TextStyle(fontSize: 30),
              ),
              Text(
                day.doneTasks[index].description,
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onTap() {}
}
