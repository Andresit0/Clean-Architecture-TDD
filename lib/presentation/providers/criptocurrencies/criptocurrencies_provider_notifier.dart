part of presentation.providers.criptocurrencies;

class CriptocurrenciesNotifier
    extends StateNotifier<List<CriptocurrencyEntity>> {
  bool isLoading = false;
  CriptocurrencyCallback getCriptocurrencies;

  CriptocurrenciesNotifier({
    required this.getCriptocurrencies,
  }) : super([]);

  Future<void> loadNextCriptocurrencyData(
      {List<String> currencyIDs =
          CustomList.criptocurrenciesMostKnowledge}) async {
    if (isLoading) return;
    isLoading = true;
    var newCriptocurrenciesList = getCriptocurrencies(currencyIDs);
    state = await newCriptocurrenciesList;
    await Future.delayed(const Duration(seconds: 5));
    isLoading = false;
  }
}
