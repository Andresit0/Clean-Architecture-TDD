import 'package:clean_architecture/domain/entities/criptocurrency_entity.dart';

abstract class CriptocurrencyDatasource {
  Future<List<CriptocurrencyEntity>> getCriptocurrencies(
      List<String> currencyIdsList);
}
