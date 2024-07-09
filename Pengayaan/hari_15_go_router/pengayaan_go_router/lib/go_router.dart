part of 'routers_go.dart';

var routerGo = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreenPage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: '/details',
          builder: (BuildContext context, GoRouterState state) {
            return const DetailScreenPage();
          },
        ),
      ],
    ),
  ],
);
