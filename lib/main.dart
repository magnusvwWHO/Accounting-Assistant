import 'package:flutter/material.dart';
import 'package:school_accounting_assistant/routes/app_routes.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green.shade50,
        cardColor: Colors.green.shade100,
      ),
    );
  }
}
