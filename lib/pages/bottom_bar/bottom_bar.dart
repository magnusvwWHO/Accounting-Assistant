import 'package:accounting_assistant/pages/bottom_bar/bottom_bar_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key, required this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<BottomBarProvider>();
    return Scaffold(
      body: child,
      bottomNavigationBar: SalomonBottomBar(
        backgroundColor: Colors.blue.shade50,
        currentIndex: provider.currentIndex,
        onTap: (index) => provider.onTap(index),
        items: [
          SalomonBottomBarItem(
            icon: const Icon(
              Icons.list_alt,
              size: 30,
            ),
            title: const Text("Days"),
          ),
          SalomonBottomBarItem(
            icon: const Icon(
              Icons.library_add_check,
              size: 30,
            ),
            title: const Text("Tasks"),
          ),
        ],
      ),
    );
  }
}
