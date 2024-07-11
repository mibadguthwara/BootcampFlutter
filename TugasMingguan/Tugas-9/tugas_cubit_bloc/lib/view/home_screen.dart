part of 'pages.dart';

class HomeScreen extends StatelessWidget {
  final String extra;
  const HomeScreen({super.key, required this.extra});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerScreen(),
      appBar: AppBar(
        title: const Text('Beranda'),
        backgroundColor: Colors.amber,
      ),
      // drawer: const DrawerScreen(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Welcome,",
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              extra,
              style: const TextStyle(fontSize: 38),
            ),
          ],
        ),
      ),
    );
  }
}
