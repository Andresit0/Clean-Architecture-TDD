import '../../domain/entities/criptocurrency_entity.dart';
import '../models/criptocurrency_coingecko_model.dart';

class CriptocurrencyMapper {
  static CriptocurrencyEntity criptocurrencyToEntity(
          CriptocurrencyCoingeckoModel criptocurrencyCoingeckoModel) =>
      (CriptocurrencyEntity(
          name: criptocurrencyCoingeckoModel.name!,
          symbol: criptocurrencyCoingeckoModel.symbol!,
          price: criptocurrencyCoingeckoModel.currentPrice!));
}
