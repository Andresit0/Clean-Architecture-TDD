part of presentation.providers.criptocurrencies;

typedef CriptocurrencyCallback = Future<CriptoCurrencyListStateEntity>
    Function({
  required List<String> currencyIdsList,
  required BuildContext context,
});
