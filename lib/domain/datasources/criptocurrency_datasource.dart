part of domain.datasources;

abstract class CriptocurrencyDatasource {
  Future<CriptoCurrencyListStateEntity> getCriptocurrencies({
    required List<String> currencyIdsList,
    required BuildContext context,
  });
}
