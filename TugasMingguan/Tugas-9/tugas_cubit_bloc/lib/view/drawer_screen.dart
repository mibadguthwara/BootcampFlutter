import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/logic/drawer_bloc/drawer_bloc.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(child: BlocBuilder<DrawerBloc, DrawerState>(
      builder: (context, state) {
        return ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
                decoration: BoxDecoration(color: Colors.white),
                child: Text('Drawer Header')),
            ListTile(
              title: const Text('Menu Item 1'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Menu Item 2'),
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    ));
  }
}
