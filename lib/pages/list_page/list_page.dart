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
      builder: (context, child) => Scaffold(),
      // builder: (context, child) => Scaffold(
      //   body: Consumer<ListPageProvider>(
      //     builder: (context, provider, child) => ListView.builder(
      //       padding: const EdgeInsets.all(16),
      //       itemCount: 5 /* HARDCODE */,
      //       itemBuilder: (context, index) => const Padding(
      //         padding: EdgeInsets.symmetric(vertical: 10.0),
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.start,
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
