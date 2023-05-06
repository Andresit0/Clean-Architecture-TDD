part of presentation.controllers;

class CriptocurrenciesRiverpodPage extends ConsumerStatefulWidget {
  const CriptocurrenciesRiverpodPage({super.key});
  @override
  CriptocurrenciesRiverpodState createState() =>
      CriptocurrenciesRiverpodState();
}

class CriptocurrenciesRiverpodState
    extends ConsumerState<CriptocurrenciesRiverpodPage> {
  @override
  void initState() {
    super.initState();
    ref.read(getCriptocurrenciesProvider.notifier).loadNextCriptocurrencyData();
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
      body: CriptocurrenciesScreen(criptocurrrencies: criptoCurrrencies),
    );
  }
}
