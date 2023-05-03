part of presentation.providers.criptocurrencies;

final getCriptocurrenciesProvider =
    StateNotifierProvider<CriptocurrenciesNotifier, List<CriptocurrencyEntity>>(
        (ref) {
  final getCriptocurrencies =
      ref.watch(criptocurrenciesRepositoryProvider).getCriptocurrency;
  return CriptocurrenciesNotifier(getCriptocurrencies: getCriptocurrencies);
});
