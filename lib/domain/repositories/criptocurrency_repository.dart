import 'package:clean_architecture/domain/entities/criptocurrency_entity.dart';

abstract class CriptocurrencyRepository {
  Future<List<CriptocurrencyEntity>> getCriptocurrency(
      List<String> currencyIdsList);
}
