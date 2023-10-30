import 'package:flutter/material.dart';

class DefaultWidthPadding extends StatelessWidget {
  const DefaultWidthPadding({
    super.key,
    this.width = 16,
  });

  const DefaultWidthPadding.small({
    super.key,
    this.width = 8,
  });

  const DefaultWidthPadding.large({
    super.key,
    this.width = 32,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width);
  }
}
