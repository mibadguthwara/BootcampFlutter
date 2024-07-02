import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.notifications)),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.add_shopping_cart)),
                    ],
                  ),
                  const Text(
                    "Welcome,",
                    style: TextStyle(
                        fontSize: 40,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "Hilmy",
                    style: TextStyle(fontSize: 38),
                  ),
                  const SizedBox(height: 50),
                  const SearchBar(
                    hintText: "Search",
                    leading: Icon(Icons.search),
                  ),
                  const SizedBox(height: 50),
                  const Text(
                    "Recommended Place",
                    style: TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 120,
                        height: 70,
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(
                          "assets/images/monas.png",
                          width: 100,
                          height: 60,
                        ),
                      ),
                      Container(
                        width: 120,
                        height: 70,
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(
                          "assets/images/roma.png",
                          width: 100,
                          height: 60,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 120,
                        height: 70,
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(
                          "assets/images/berlin.png",
                          width: 100,
                          height: 60,
                        ),
                      ),
                      Container(
                        width: 120,
                        height: 70,
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(
                          "assets/images/tokyo.png",
                          width: 100,
                          height: 60,
                        ),
                      ),
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
