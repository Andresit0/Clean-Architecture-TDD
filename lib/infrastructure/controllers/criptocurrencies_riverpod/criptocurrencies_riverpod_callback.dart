part of presentation.providers.criptocurrencies;

typedef CriptocurrencyCallback = Future<CriptoCurrencyListState> Function(
    List<String> listCriptocurrencies);
