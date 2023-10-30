import 'package:flutter/material.dart';

class DefaultHeightPadding extends StatelessWidget {
  const DefaultHeightPadding({
    super.key,
    this.height = 16,
  });

  const DefaultHeightPadding.small({
    super.key,
    this.height = 8,
  });

  const DefaultHeightPadding.large({
    super.key,
    this.height = 32,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}
