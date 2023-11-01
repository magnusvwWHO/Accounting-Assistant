import 'package:flutter/material.dart';
import 'package:school_accounting_assistant/pages/components/loading/loading_animated_icon.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LoadingAnimatedIcon(context: context),
      ),
    );
  }
}
