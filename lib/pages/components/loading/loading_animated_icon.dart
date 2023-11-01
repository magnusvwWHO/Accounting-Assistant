import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingAnimatedIcon extends StatelessWidget {
  const LoadingAnimatedIcon({super.key, required this.context});

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.discreteCircle(
      color: Colors.green.shade700,
      secondRingColor: Colors.green,
      thirdRingColor: Colors.green.shade200,
      size: 60.0,
    );
  }
}
