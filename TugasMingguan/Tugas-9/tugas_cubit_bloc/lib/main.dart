import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/logic/bottom_navbar_cubit/bottom_nav_cubit.dart';
import '/logic/drawer_bloc/drawer_bloc.dart';
import '/routes/go_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DrawerBloc>(
          create: (_) => DrawerBloc(),
        ),
        BlocProvider<BottomNavCubit>(
          create: (_) => BottomNavCubit(),
        ),
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routerConfig: AppRouter.shared.router,
        debugShowCheckedModeBanner: false,
        // home: RoutesApp(),
      ),
    );
  }
}
