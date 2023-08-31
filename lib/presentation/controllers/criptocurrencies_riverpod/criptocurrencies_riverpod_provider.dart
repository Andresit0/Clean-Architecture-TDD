part of presentation.providers.criptocurrencies;

final getCriptocurrenciesProvider = StateNotifierProvider<
    CriptocurrenciesNotifier, CriptoCurrencyListStateEntity>((ref) {
  return CriptocurrenciesNotifier(ref: ref);
});

final getCriptocurrenciesLoadingProvider = StateNotifierProvider<
    CriptocurrenciesLoadingNotifier, CriptoCurrencyListStateEntity>((ref) {
  return CriptocurrenciesLoadingNotifier();
});
