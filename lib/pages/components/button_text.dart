import 'package:flutter/material.dart';

class ButtonText extends StatelessWidget {
  const ButtonText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16.0,
        color: Colors.black,
      ),
    );
  }
}
