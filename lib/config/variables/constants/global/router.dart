part of config.variables;

class CustomConstRoute {
  GoRouter appRouter = GoRouter(initialLocation: '/', routes: [
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),
  ]);
}
