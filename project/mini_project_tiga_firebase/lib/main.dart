import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'helper/firebase_option.dart';
import 'helper/fcm_helper.dart';
import 'helper/notification_helper.dart';
import 'logic/auth/auth_bloc.dart';
import 'logic/cubit/images_cubit.dart';
import 'logic/product/product_bloc.dart';
import 'logic/profile/user_bloc.dart';
import 'logic/cart/cart_bloc.dart';
import 'services/product_repository.dart';
import 'services/cart_repository.dart';
import 'pages/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // inisialisasi local notification
  await NotificationHelper().initLocalNotifications();

  // inisialisasi project firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // inisialisasi FCM
  await FcmHelper().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
        BlocProvider<ProductBloc>(
          create: (context) => ProductBloc()..add(LoadProducts()),
        ),
        BlocProvider<UserBloc>(
          create: (context) => UserBloc()..add(const LoadUserById(5)),
        ),
        BlocProvider(
          create: (context) =>
              CartBloc(CartRepository(productRepository: ProductRepository()))
                ..add(LoadCartEvent()),
        ),
        BlocProvider(
          create: (context) => ImagesCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Mini Project 3',
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
