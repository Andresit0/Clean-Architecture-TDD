part of presentation.providers.criptocurrencies;

class CriptocurrenciesNotifier
    extends StateNotifier<CriptoCurrencyListStateEntity> {
  StateNotifierProviderRef<CriptocurrenciesNotifier,
      CriptoCurrencyListStateEntity> ref;

  CriptocurrenciesNotifier({
    required this.ref,
  }) : super(const CriptoCurrencyListStateEntity(isLoading: true));

  Future<CriptoCurrencyListStateEntity> loadNextCriptocurrencyData({
    List<String>? currencyIDs,
    required BuildContext context,
  }) async {
    ref
        .read(getCriptocurrenciesLoadingProvider.notifier)
        .newCriptoCurrencyListStateEntity(
            const CriptoCurrencyListStateEntity(isLoading: true));
    CriptoCurrencyListStateEntity response =
        await ref.watch(criptocurrenciesRepositoryProvider).getCriptocurrency(
              currencyIdsList: currencyIDs ??
                  CustomVariables
                      .constCriptocurrencyList.criptocurrenciesMostKnowledge,
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
    return response;
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
