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
        builder: (context, state) => const HomePage(),
        routes: [
          GoRoute(
            path: CriptocurrenciesRiverpodPageCtrl.name,
            builder: (context, state) =>
                const CriptocurrenciesRiverpodPageCtrl(),
          ),
          GoRoute(
            path: CriptocurrenciesRiverpod2PageCtrl.name,
            builder: (context, state) =>
                const CriptocurrenciesRiverpod2PageCtrl(),
          ),
          GoRoute(
            path: CriptocurrenciesBloc.name,
            builder: (context, state) => const CriptocurrenciesBloc(),
          ),
          GoRoute(
            path: CriptocurrenciesCubit.name,
            builder: (context, state) => const CriptocurrenciesCubit(),
          ),
          GoRoute(
            path: CriptocurrenciesProviderPage.name,
            builder: (context, state) => const CriptocurrenciesProviderPage(),
          ),
          GoRoute(
            path: CriptocurrenciesStreamPage.name,
            builder: (context, state) => const CriptocurrenciesStreamPage(),
          ),
        ],
      ),
    ],
  );
}
