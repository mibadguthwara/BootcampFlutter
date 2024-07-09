part of '../routers_go.dart';

class DetailScreenPage extends StatelessWidget {
  const DetailScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details Screen go"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.go('/'),
          child: const Text('Go back to the home screen'),
        ),
      ),
    );
  }
}
