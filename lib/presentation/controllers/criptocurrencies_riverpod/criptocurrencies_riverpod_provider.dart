part of presentation.providers.criptocurrencies;

final getCriptocurrenciesProvider = StateNotifierProvider.autoDispose<
    CriptocurrenciesNotifier, CriptoCurrencyListStateEntity>((ref) {
  final getCriptocurrencies =
      ref.watch(criptocurrenciesRepositoryProvider).getCriptocurrency;
  return CriptocurrenciesNotifier(getCriptocurrencies: getCriptocurrencies);
});
