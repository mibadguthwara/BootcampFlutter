import 'package:go_router/go_router.dart';

import 'local_notification_screen.dart';
import 'maps_screen.dart';
import 'main_screen.dart';

final router = GoRouter(
  routes: [
    ShellRoute(
      builder: (context, state, child) => const MainScreen(),
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const MapsScreen(),
        ),
        GoRoute(
          path: '/local-notification',
          builder: (context, state) => const LocalNotificationScreen(),
        ),
      ],
    )
  ],
);
