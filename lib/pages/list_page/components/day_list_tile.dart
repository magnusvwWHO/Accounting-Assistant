import 'package:accounting_assistant/data_classes/day_task.dart';
import 'package:accounting_assistant/pages/list_page/list_page_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class DayListTile extends StatelessWidget {
  const DayListTile({super.key, required this.day});
  final Day day;

  @override
  Widget build(BuildContext contextMain) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              color: Theme.of(contextMain).cardColor,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 2.0,
                  spreadRadius: 1.0,
                  offset: Offset(0.0, 1.0),
                ),
              ],
            ),
            child: Column(
              children: [
                Text(
                  ("${day.date.day}.${day.date.month}.${day.date.year}"),
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: day.doneTasks.length,
                  itemBuilder: (context, index) => Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 12.0),
                        child: Icon(Icons.circle, size: 12.0),
                      ),
                      Expanded(
                        child: TextButton(
                          onPressed: () => showTaskAlert(context, index),
                          onLongPress: () =>
                              showDeleteAlert(contextMain, index),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                day.doneTasks[index].title,
                                style: const TextStyle(
                                  fontSize: 24.0,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
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
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                day.doneTasks[index].title,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                day.doneTasks[index].description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        actions: [
          Align(
            alignment: Alignment.center,
            child: TextButton(
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
          ),
        ],
      ),
    );
  }

  Future<dynamic> showDeleteAlert(BuildContext contextMain, int index) {
    return showDialog(
      context: contextMain,
      barrierDismissible: true,
      builder: (context) => AlertDialog(
        title: Text(
          'Удаление ${day.doneTasks[index].title}',
          textAlign: TextAlign.center,
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
                  contextMain.read<ListPageProvider>().deleteTask(day, index);
                  GoRouter.of(context).pop();
                }, // TODO: Implement deleting task
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

  void onTap() {}
}
