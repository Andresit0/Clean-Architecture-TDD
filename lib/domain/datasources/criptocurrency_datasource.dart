part of domain.datasources;

abstract class CriptocurrencyDatasource {
  Future<CriptoCurrencyListState> getCriptocurrencies(
      List<String> currencyIdsList);
}
