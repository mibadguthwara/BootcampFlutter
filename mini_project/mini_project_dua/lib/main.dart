import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'helper/notification_helper.dart';
import 'pages/splash_screen.dart';
import 'bloc/product/product_bloc.dart';
import 'bloc/user/user_bloc.dart';
import 'bloc/cart/cart_bloc.dart';
import 'repositories/product_repository.dart';
import 'repositories/cart_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationHelper().initLocalNotifications();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductBloc>(
          create: (_) => ProductBloc()..add(LoadProducts()),
        ),
        BlocProvider<UserBloc>(
          create: (_) => UserBloc()..add(const LoadUserById(2)),
        ),
        BlocProvider(
          create: (context) =>
              CartBloc(CartRepository(productRepository: ProductRepository()))
                ..add(LoadCartEvent()),
        ),
      ],
      child: MaterialApp(
        title: 'Mini Project 2',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.green, brightness: Brightness.light),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
