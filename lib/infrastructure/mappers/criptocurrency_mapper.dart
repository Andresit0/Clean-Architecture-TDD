part of infrastructure.mappers;

class CriptocurrencyMapper {
  static CriptocurrencyEntity criptocurrencyToEntity(
          CriptocurrencyCoingeckoModel criptocurrencyCoingeckoModel) =>
      (CriptocurrencyEntity(
          name: criptocurrencyCoingeckoModel.name!,
          symbol: criptocurrencyCoingeckoModel.symbol!,
          price: criptocurrencyCoingeckoModel.currentPrice!));
}
