part of infrastructure.datasources;

class CriptocurrencyDatasourceImp extends CriptocurrencyDatasource {
  @override
  Future<CriptoCurrencyListState> getCriptocurrencies(
      List<String> currencyIdsList) async {
    Uri uri = CustomVariables.constUri.coingeckoMarkets.replace(
      queryParameters: {
        'vs_currency': 'usd',
        'ids': currencyIdsList.join(','),
      },
    );
    var result = await CustomFunctions.request.get(uri: uri);
    return CriptoCurrencyListState(
      listCriptoCurrency: result
          .map<CriptocurrencyEntity>((json) =>
              CriptocurrencyMapper.criptocurrencyToEntity(
                  CriptocurrencyCoingeckoModel.fromJson(json)))
          .toList(),
    );
  }
}
