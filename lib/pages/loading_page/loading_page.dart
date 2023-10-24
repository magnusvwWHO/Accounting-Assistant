import 'package:accounting_assistant/pages/loading_page/loading_page_provider.dart';
import 'package:accounting_assistant/router/pages_list.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<String?>(
        future: context.read<LoadingPageProvider>().loadData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              GoRouter.of(context).go(list);
            });
            return const SizedBox.shrink();
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.data!),
            );
          } else {
            return Center(
              child: Row(
                children: [
                  const Expanded(child: SizedBox.shrink()),
                  LoadingAnimationWidget.discreteCircle(
                    color: Theme.of(context).cardColor,
                    secondRingColor: Theme.of(context).colorScheme.background,
                    thirdRingColor: Colors.white,
                    size: 60.0,
                  ),
                  const Expanded(child: SizedBox.shrink()),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
