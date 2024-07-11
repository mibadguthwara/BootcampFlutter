import 'package:go_router/go_router.dart';
import '/routes/named_go_router.dart';
import '/view/login_screen.dart';
import '/view/pages.dart';

class AppRouter {
  static final AppRouter shared = AppRouter._internal();

  factory AppRouter() {
    return shared;
  }

  AppRouter._internal();

  final router = GoRouter(
    routes: [
      GoRoute(
        path: RouteNames.splashScreen,
        name: RouteNames.splashScreen,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: RouteNames.loginScreen,
        name: RouteNames.loginScreen,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: RouteNames.mainScreen,
        name: RouteNames.mainScreen,
        builder: (context, state) => const MainScreen(),
      ),
      GoRoute(
        path: RouteNames.homeScreen,
        name: RouteNames.homeScreen,
        builder: (context, state) {
          return const HomeScreen(extra: 'extra');
        },
      ),
      GoRoute(
        path: RouteNames.listViewScreen,
        name: RouteNames.listViewScreen,
        builder: (context, state) => ListViewScreen(),
      ),
    ],
  );
}
