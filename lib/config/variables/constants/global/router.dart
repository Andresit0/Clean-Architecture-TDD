part of config.variables;

class CustomConstRoute {
  GoRouter appRouter = GoRouter(
    initialLocation: '/home',
    routes: [
      GoRoute(
        path: '/',
        redirect: (_, __) => HomePage.path,
      ),
      GoRoute(
        path: HomePage.path,
        builder: (context, state) => HomePage(),
        routes: [
          GoRoute(
            path: CriptocurrenciesRiverpodPageCtrl.name,
            builder: (context, state) =>
                const CriptocurrenciesRiverpodPageCtrl(),
          ),
        ],
      ),
    ],
  );
}
