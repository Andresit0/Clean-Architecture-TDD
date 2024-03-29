part of presentation.screens;

class CriptocurrenciesRiverpodPageCtrl extends ConsumerStatefulWidget {
  static const name = 'criptocurrencies_riverpod';
  static const path = '/home/criptocurrencies_riverpod';
  static bool reload = true;
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
    updateCriptoCurrencyList(context);
  }

  updateCriptoCurrencyList(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2), () {
      ref
          .watch(getCriptocurrenciesProvider.notifier)
          .loadNextCriptocurrencyData(context: context);
    });
    while (CriptocurrenciesRiverpodPageCtrl.reload) {
      await Future.delayed(const Duration(seconds: 30)).then((value) async {
        await ref
            .watch(getCriptocurrenciesProvider.notifier)
            .loadNextCriptocurrencyData(
              currencyIDs:
                  CustomVariables.dynCriptocurrencyList.criptocurrencies,
              context: context,
            );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    CriptoCurrencyListStateEntity criptoCurrrencies =
        ref.watch(getCriptocurrenciesLoadingProvider);
    return Scaffold(
      backgroundColor: CustomVariables.constColors.appBackground,
      body: CriptocurrenciesView(criptocurrrencies: criptoCurrrencies),
    );
  }
}
