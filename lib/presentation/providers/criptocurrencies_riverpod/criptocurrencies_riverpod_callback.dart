part of presentation.providers.criptocurrencies;

typedef CriptocurrencyCallback = Future<CriptoCurrencyListState> Function({
  required List<String> currencyIdsList,
  required BuildContext context,
});
