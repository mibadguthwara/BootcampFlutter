import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'news_org_screen.dart';
import '/bloc/news_org_bloc.dart';
import '/services/news_services.dart';

class BlocProvider23 extends StatelessWidget {
  const BlocProvider23({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewsOrgBloc(NewsServices()),
        ),
      ],
      child: const NewsOrgScreen(),
    );
  }
}
