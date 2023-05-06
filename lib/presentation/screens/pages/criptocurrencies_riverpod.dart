part of presentation.screens;

class CriptocurrenciesRiverpodPageCtrl extends ConsumerStatefulWidget {
  static const name = 'criptocurrencies_riverpod';
  static const path = '/home/criptocurrencies_riverpod';
  const CriptocurrenciesRiverpodPageCtrl({super.key});
  @override
  CriptocurrenciesRiverpodState createState() =>
      CriptocurrenciesRiverpodState();
}

class CriptocurrenciesRiverpodState
    extends ConsumerState<CriptocurrenciesRiverpodPageCtrl> {
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
      body: CriptocurrenciesView(criptocurrrencies: criptoCurrrencies),
    );
  }
}
