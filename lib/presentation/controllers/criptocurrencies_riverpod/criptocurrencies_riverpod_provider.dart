part of presentation.providers.criptocurrencies;

final getCriptocurrenciesProvider = StateNotifierProvider<
    CriptocurrenciesNotifier, CriptoCurrencyListStateEntity>((ref) {
  final getCriptocurrencies =
      ref.watch(criptocurrenciesRepositoryProvider).getCriptocurrency;
  return CriptocurrenciesNotifier(
      getCriptocurrencies: getCriptocurrencies, ref: ref);
});

final getCriptocurrenciesLoadingProvider = StateNotifierProvider<
    CriptocurrenciesLoadingNotifier, CriptoCurrencyListStateEntity>((ref) {
  return CriptocurrenciesLoadingNotifier();
});
