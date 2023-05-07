part of infrastructure.repositories;

class CriptocurrencyRepositoryImp extends CriptocurrencyRepository {
  final CriptocurrencyDatasource datasource;
  CriptocurrencyRepositoryImp(this.datasource);

  @override
  Future<CriptoCurrencyListState> getCriptocurrency({
    required List<String> currencyIdsList,
    required BuildContext context,
  }) {
    return datasource.getCriptocurrencies(
        currencyIdsList: currencyIdsList, context: context);
  }
}
