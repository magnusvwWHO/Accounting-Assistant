import 'package:flutter/material.dart';

class DonePage extends StatelessWidget {
  const DonePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'This is Done Page!',
          style: TextStyle(fontSize: 42.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
