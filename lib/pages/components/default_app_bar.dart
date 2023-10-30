import 'package:flutter/material.dart';

class DefaultAppBar extends StatelessWidget {
  const DefaultAppBar(
    this.onPressed, {
    super.key,
    required this.title,
    required this.icon,
  });

  final String title;
  final Icon icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 24.0,
        ),
      ),
      leading: Padding(
        padding: const EdgeInsets.only(left: 2.0),
        child: TextButton(
          onPressed: onPressed,
          child: icon,
        ),
      ),
    );
  }
}
