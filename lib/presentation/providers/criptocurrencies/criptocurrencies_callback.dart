part of presentation.providers.criptocurrencies;

typedef CriptocurrencyCallback = Future<List<CriptocurrencyEntity>> Function(
    List<String> listCriptocurrencies);
