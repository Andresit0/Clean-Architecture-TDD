part of domain.datasources;

abstract class CriptocurrencyDatasource {
  Future<CriptoCurrencyListState> getCriptocurrencies({
    required List<String> currencyIdsList,
    required BuildContext context,
  });
}
