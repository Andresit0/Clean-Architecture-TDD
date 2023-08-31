part of presentation.screens;

class CriptocurrenciesRiverpod2PageCtrl extends ConsumerStatefulWidget {
  static const name = 'criptocurrencies_riverpod2';
  static const path = '/home/criptocurrencies_riverpod2';
  static bool reload = true;
  const CriptocurrenciesRiverpod2PageCtrl({super.key});
  @override
  CriptocurrenciesRiverpod2State createState() =>
      CriptocurrenciesRiverpod2State();
}

class CriptocurrenciesRiverpod2State
    extends ConsumerState<CriptocurrenciesRiverpod2PageCtrl> {
  @override
  void initState() {
    super.initState();
    updateCriptoCurrencyList(context);
  }

  updateCriptoCurrencyList(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 1), () {
      ref
          .watch(criptocurrenciesRiverpod2Provider.notifier)
          .loadNextCriptocurrencyData(context: context);
    });
    while (CriptocurrenciesRiverpod2PageCtrl.reload) {
      await Future.delayed(const Duration(seconds: 30)).then((value) async {
        await ref
            .watch(criptocurrenciesRiverpod2Provider.notifier)
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
        ref.watch(criptocurrenciesLoadingRiverpod2Provider);
    return Scaffold(
      backgroundColor: CustomVariables.constColors.appBackground,
      body: CriptocurrenciesView(criptocurrrencies: criptoCurrrencies),
    );
  }
}
