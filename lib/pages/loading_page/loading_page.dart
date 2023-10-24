import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoadingAnimationWidget.discreteCircle(
        color: Theme.of(context).cardColor,
        secondRingColor: Theme.of(context).colorScheme.background,
        thirdRingColor: Colors.white,
        size: 60.0,
      ),
    );
  }
}
