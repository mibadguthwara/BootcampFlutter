import 'package:flutter/material.dart';
import '/view/pages.dart';

class RoutesApp extends StatelessWidget {
  const RoutesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(
                builder: (_) => const HomeScreen(extra: 'extra'));

          case '/listview-screen':
            return MaterialPageRoute(builder: (_) => ListViewScreen());
          default:
            return MaterialPageRoute(
                builder: (_) => const HomeScreen(extra: 'extra'));
        }
      },
    );
  }
}
