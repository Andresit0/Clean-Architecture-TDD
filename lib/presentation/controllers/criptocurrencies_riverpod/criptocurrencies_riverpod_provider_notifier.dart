part of presentation.providers.criptocurrencies;

class CriptocurrenciesNotifier
    extends StateNotifier<CriptoCurrencyListStateEntity> {
  CriptocurrencyCallback getCriptocurrencies;
  StateNotifierProviderRef<CriptocurrenciesNotifier,
      CriptoCurrencyListStateEntity> ref;

  CriptocurrenciesNotifier({
    required this.getCriptocurrencies,
    required this.ref,
  }) : super(const CriptoCurrencyListStateEntity(isLoading: true));

  Future<void> loadNextCriptocurrencyData({
    List<String>? currencyIDs,
    required BuildContext context,
  }) async {
    ref
        .read(getCriptocurrenciesLoadingProvider.notifier)
        .newCriptoCurrencyListStateEntity(
            const CriptoCurrencyListStateEntity(isLoading: true));
    CriptoCurrencyListStateEntity response = await getCriptocurrencies(
      currencyIdsList: currencyIDs ??
          CustomVariables.constCriptocurrencyList.criptocurrenciesMostKnowledge,
      context: context,
    );
    state = response;

    /// Future.delayed to watch loading.
    /// Remove getCriptocurrenciesLoadingProvider and CriptocurrenciesLoadingNotifier to delete loading and
    /// use only getCriptocurrenciesProvider inside criptocurrencies_riverpod.dart
    await Future.delayed(const Duration(seconds: 2), () {
      ref
          .read(getCriptocurrenciesLoadingProvider.notifier)
          .newCriptoCurrencyListStateEntity(response);
    });
  }
}

class CriptocurrenciesLoadingNotifier
    extends StateNotifier<CriptoCurrencyListStateEntity> {
  CriptocurrenciesLoadingNotifier()
      : super(const CriptoCurrencyListStateEntity(isLoading: true));
  void newCriptoCurrencyListStateEntity(
      CriptoCurrencyListStateEntity criptoCurrencyListStateEntity) {
    state = criptoCurrencyListStateEntity;
  }
}
