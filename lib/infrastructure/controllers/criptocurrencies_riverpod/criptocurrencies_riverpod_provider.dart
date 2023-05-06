part of presentation.providers.criptocurrencies;

final getCriptocurrenciesProvider =
    StateNotifierProvider<CriptocurrenciesNotifier, CriptoCurrencyListState>(
        (ref) {
  final getCriptocurrencies =
      ref.watch(criptocurrenciesRepositoryProvider).getCriptocurrency;
  return CriptocurrenciesNotifier(getCriptocurrencies: getCriptocurrencies);
});
