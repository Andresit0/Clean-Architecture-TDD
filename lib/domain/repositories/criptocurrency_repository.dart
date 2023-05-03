import 'package:clean_architecture/domain/entities/criptocurrency_entity.dart';

abstract class CriptocurrencyRepository {
  Future<CriptoCurrencyListState> getCriptocurrency(
      List<String> currencyIdsList);
}
