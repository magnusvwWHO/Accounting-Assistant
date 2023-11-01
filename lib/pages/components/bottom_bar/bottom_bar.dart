import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:school_accounting_assistant/pages/components/bottom_bar/bottom_bar_provider.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key, required this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<BottomBarProvider>();

    return Scaffold(
      body: child,
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: provider.currentIndex,
        onTap: (index) => provider.changeIndex(index),
        items: [
          SalomonBottomBarItem(
            icon: const Icon(
              Icons.list_alt_rounded,
              size: 30.0,
            ),
            title: const Text('Done'),
          ),
          SalomonBottomBarItem(
            icon: const Icon(
              Icons.check_box,
              size: 30.0,
            ),
            title: const Text('Active'),
          ),
        ],
      ),
    );
  }
}
