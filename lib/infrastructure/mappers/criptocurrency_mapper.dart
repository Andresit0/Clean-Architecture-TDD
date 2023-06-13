part of infrastructure.mappers;

class CriptocurrencyMapper {
  static CriptocurrencyEntity criptocurrencyToEntity({
    required CriptocurrencyCoingeckoModel criptocurrencyCoingeckoModel,
    RestErrorEntity? restError,
  }) =>
      (CriptocurrencyEntity(
          name: criptocurrencyCoingeckoModel.name!,
          symbol: criptocurrencyCoingeckoModel.symbol!,
          price: criptocurrencyCoingeckoModel.currentPrice!,
          restError: restError));
}
