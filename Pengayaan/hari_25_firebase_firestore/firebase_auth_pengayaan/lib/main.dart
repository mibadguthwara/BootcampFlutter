import 'package:firebase_auth_pengayaan/logic/cubit/images_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'firebase_option.dart';
import 'logic/auth/auth_bloc.dart';
import 'logic/user/user_bloc.dart';
import '/ui/main_pages/main_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.android,
  );
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
          BlocProvider(
            create: (context) => UserBloc(),
          ),
          BlocProvider(
            create: (context) => ImagesCubit(),
          ),
        ],
        child: MaterialApp(
          title: 'Materi Firebase',
          theme: ThemeData(useMaterial3: true),
          home: const MainPages(),
        ));
  }
}
