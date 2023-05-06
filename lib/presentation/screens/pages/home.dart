part of presentation.screens;

class HomePage extends StatelessWidget {
  static const name = 'home';
  static const path = '/home';
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomePage(),
    );
  }
}

class _HomePage extends ConsumerStatefulWidget {
  const _HomePage();
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<_HomePage> {
  @override
  void initState() {
    super.initState();
    ref.read(getCriptocurrenciesProvider.notifier).loadNextCriptocurrencyData();
  }

  Widget criptoCurrencyList() {
    return Column(
      children: [
        TextButton(
          onPressed: () => CustomVariables.constRoute.appRouter
              .push(CriptocurrenciesRiverpodPageCtrl.path),
          child: const Text('Riverpod'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomVariables.constColors.appBackground,
      body: criptoCurrencyList(),
    );
  }
}
