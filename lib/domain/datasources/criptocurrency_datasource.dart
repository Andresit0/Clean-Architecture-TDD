import 'package:clean_architecture/domain/entities/criptocurrency_entity.dart';

abstract class CriptocurrencyDatasource {
  Future<CriptoCurrencyListState> getCriptocurrencies(
      List<String> currencyIdsList);
}
