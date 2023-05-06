part of infrastructure.repositories;

class CriptocurrencyRepositoryImp extends CriptocurrencyRepository {
  final CriptocurrencyDatasource datasource;
  CriptocurrencyRepositoryImp(this.datasource);

  @override
  Future<CriptoCurrencyListState> getCriptocurrency(
      List<String> currencyIdsList) {
    return datasource.getCriptocurrencies(currencyIdsList);
  }
}
