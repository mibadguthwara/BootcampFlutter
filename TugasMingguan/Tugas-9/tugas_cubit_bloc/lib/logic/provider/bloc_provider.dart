import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/logic/bottom_navbar_cubit/bottom_nav_cubit.dart';
import '/logic/drawer_bloc/drawer_bloc.dart';
import '/view/pages.dart';

class BlocProviderPage extends StatelessWidget {
  const BlocProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider<DrawerBloc>(create: (_) => DrawerBloc()),
          BlocProvider<BottomNavCubit>(create: (_) => BottomNavCubit()),
        ],
        child: const MainScreen(),
      ),
    );
  }
}
