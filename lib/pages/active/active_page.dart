import 'package:flutter/material.dart';

class ActivePage extends StatelessWidget {
  const ActivePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'This is Active Page!',
          style: TextStyle(fontSize: 42.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
