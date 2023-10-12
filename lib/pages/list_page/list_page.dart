import 'package:accounting_assistant/pages/list_page/list_page_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ListPageProvider>();

    return ChangeNotifierProvider(
      create: (context) => ListPageProvider(context: context),
      builder: (context, child) => ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        itemCount: provider.tasks.length,
        itemBuilder: (context, index) => TextButton(
          onPressed:() => ,
          child: Text(''),
        ),
      ),
    );
  }
}
