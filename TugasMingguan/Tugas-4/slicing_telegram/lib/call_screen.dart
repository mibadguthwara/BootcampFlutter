import 'package:flutter/material.dart';

class CallScreen extends StatelessWidget {
  static const routeName = '/call_screen';
  const CallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        title: const Text("Calls"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.add_ic_call_outlined)),
        ],
      ),
      body: const Center(
        child: Text(
          "No Call History",
        ),
      ),
    );
  }
}
