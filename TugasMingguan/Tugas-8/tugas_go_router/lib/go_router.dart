// import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '/screen/listview_detail_screen.dart';
import '/screen/listview_screen.dart';
import '/screen/login_screen.dart';
import '/screen/splash_screen.dart';
import '/screen/home_screen.dart';
import '/services/model/user_model.dart';

abstract class RouterPage {
  static const splashRoute = '/';
  static const homeRoute = '/home';
  static const loginRoute = '/login';
  static const listViewRoute = '/listView';
  static const detailListViewRoute = '/detailListView';
}

var routerGo = GoRouter(
  initialLocation: RouterPage.splashRoute,
  routes: <RouteBase>[
    GoRoute(
      path: RouterPage.splashRoute,
      builder: (context, state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      path: RouterPage.loginRoute,
      builder: (context, state) {
        return const LoginScreen();
      },
    ),
    GoRoute(
      path: RouterPage.homeRoute,
      builder: (context, state) => HomeScreen(extra: state.extra as String),
    ),
    GoRoute(
      path: RouterPage.listViewRoute,
      builder: (context, state) {
        return const ListViewScreen();
      },
    ),
    GoRoute(
      path: RouterPage.detailListViewRoute,
      builder: (context, state) {
        return ListViewDetailScreen(user: UserModel());
      },
    ),
  ],
);
