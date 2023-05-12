part of presentation.providers.criptocurrencies;

class CriptocurrenciesNotifier extends StateNotifier<CriptoCurrencyListState> {
  bool isLoading = false;
  CriptocurrencyCallback getCriptocurrencies;

  CriptocurrenciesNotifier({
    required this.getCriptocurrencies,
  }) : super(const CriptoCurrencyListState(isLoading: true));

  Future<void> loadNextCriptocurrencyData({
    List<String>? currencyIDs,
    required BuildContext context,
  }) async {
    if (isLoading) return;
    isLoading = true;
    CriptoCurrencyListState newCriptocurrenciesList = await getCriptocurrencies(
      currencyIdsList: currencyIDs ??
          CustomVariables.constCriptocurrencyList.criptocurrenciesMostKnowledge,
      context: context,
    );
    state = newCriptocurrenciesList;
    await Future.delayed(const Duration(seconds: 5));
    isLoading = false;
  }
}
