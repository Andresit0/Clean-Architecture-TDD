part of infrastructure.datasources;

class CriptocurrencyDatasourceImp extends CriptocurrencyDatasource {
  @override
  Future<CriptoCurrencyListStateEntity> getCriptocurrencies({
    required List<String> currencyIdsList,
    required BuildContext context,
  }) async {
    Uri uri = CustomVariables.constUri.coingeckoMarkets.replace(
      queryParameters: {
        'vs_currency': 'usd',
        'ids': currencyIdsList.join(','),
      },
    );
    var result = await CustomFunctions.request.get(uri: uri, context: context);
    if (result is RestErrorEntity)
      return CriptoCurrencyListStateEntity(httpError: result);
    return CriptoCurrencyListStateEntity(
      listCriptoCurrency: result
          .map<CriptocurrencyEntity>((json) =>
              CriptocurrencyMapper.criptocurrencyToEntity(
                  criptocurrencyCoingeckoModel:
                      CriptocurrencyCoingeckoModel.fromJson(json)))
          .toList(),
    );
  }
}
