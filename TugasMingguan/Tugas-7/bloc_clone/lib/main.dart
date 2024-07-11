// import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/bloc/post_bloc/post_bloc.dart';
import '/view/screens/post_screen.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider<PostBloc>(create: (_) => PostBloc()),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Color seedColor = Colors.deepPurple;
  // Brightness brightness = Brightness.light;

  // void toggleSeedColor() {
  //   final List<Color> colors = [
  //     Colors.red,
  //     Colors.blue,
  //     Colors.deepOrange,
  //     Colors.deepPurple,
  //     Colors.green,
  //   ];

  //   setState(() {
  //     seedColor = colors[Random().nextInt(colors.length)];
  //   });
  // }

  // void toggleBrightness() {
  //   setState(() {
  //     brightness == Brightness.light
  //         ? brightness = Brightness.dark
  //         : brightness = Brightness.light;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Tugas Mingguan 7 - Raihan Rabbani',
      // theme: ThemeData(
      //   colorScheme:
      //       ColorScheme.fromSeed(seedColor: seedColor, brightness: brightness),
      //   useMaterial3: true,
      // ),

      home: PostScreen(
          // drawer: Drawer(
          //   child: ListView(
          //     children: [
          //       const DrawerHeader(
          //         child: Column(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: [
          //             Text(
          //               'Tugas Mingguan 7',
          //             ),
          //             Text(
          //               'Raihan Rabbani',
          //             ),
          //           ],
          //         ),
          //       ),
          //       Container(
          //         padding: const EdgeInsets.all(16),
          //         child: Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             const Text('Extra Feature'),
          //             Padding(
          //               padding: const EdgeInsets.symmetric(vertical: 8),
          //               child: Column(
          //                 crossAxisAlignment: CrossAxisAlignment.start,
          //                 children: [
          //                   FilledButton.tonalIcon(
          //                       onPressed: () => toggleSeedColor(),
          //                       icon: const Icon(Icons.color_lens),
          //                       label: const Text('Switch color')),
          //                   FilledButton.tonalIcon(
          //                       onPressed: () => toggleBrightness(),
          //                       icon: const Icon(Icons.dark_mode),
          //                       label: const Text('Switch to dark mode')),
          //                 ],
          //               ),
          //             ),
          //           ],
          //         ),
          //       )
          //     ],
          //   ),
          // ),

          ),
    );
  }
}
