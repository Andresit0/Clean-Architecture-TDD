part of presentation.screens;

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(getCriptocurrenciesProvider.notifier).loadNextCriptocurrencyData();
  }

  Widget criptoCurrencyList(CriptoCurrencyListState criptoCurrrencies) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          SizedBox(
              width: double.infinity,
              child: header(
                text: 'CRYPTOCURRENCY',
              )),
          SingleChildScrollView(
            child: Column(
              children: [
                criptoCurrrencies.httpError != null
                    ? Text(criptoCurrrencies.httpError!)
                    : criptoCurrrencies.isLoading
                        ? const CircularProgressIndicator()
                        : table(
                            titleColumn: ['NAME', 'SYMBOL', 'PRICE'],
                            bodyColumn: [
                              for (var criptocurrency
                                  in criptoCurrrencies.listCriptoCurrency!)
                                [
                                  criptocurrency.name,
                                  criptocurrency.symbol,
                                  criptocurrency.price.toString()
                                ],
                            ],
                          ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void updateCriptoCurrencyList(BuildContext context) async {
    while (true) {
      await Future.delayed(const Duration(seconds: 30)).then((value) => ref
          .read(getCriptocurrenciesProvider.notifier)
          .loadNextCriptocurrencyData(
              currencyIDs:
                  CustomVariables.dynCriptocurrencyList.criptocurrencies));
    }
  }

  @override
  Widget build(BuildContext context) {
    updateCriptoCurrencyList(context);
    final criptoCurrrencies = ref.watch(getCriptocurrenciesProvider);
    return Scaffold(
      backgroundColor: CustomVariables.constColors.appBackground,
      body: criptoCurrencyList(criptoCurrrencies),
    );
  }
}
