part of '../routers_go.dart';

class HomeScreenPage extends StatelessWidget {
  const HomeScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen go"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.go('/details'),
          child: const Text("Go to the details screen"),
        ),
      ),
    );
  }
}
