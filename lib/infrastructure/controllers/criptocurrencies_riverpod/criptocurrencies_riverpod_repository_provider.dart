part of presentation.providers.criptocurrencies;

final criptocurrenciesRepositoryProvider = Provider(
    (ref) => CriptocurrencyRepositoryImp(CriptocurrencyDatasourceImp()));
