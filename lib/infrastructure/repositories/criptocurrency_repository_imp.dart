import 'package:clean_architecture/domain/entities/criptocurrency_entity.dart';
import 'package:clean_architecture/domain/repositories/criptocurrency_repository.dart';

import '../../domain/datasources/criptocurrency_datasource.dart';

class CriptocurrencyRepositoryImp extends CriptocurrencyRepository {
  final CriptocurrencyDatasource datasource;
  CriptocurrencyRepositoryImp(this.datasource);

  @override
  Future<List<CriptocurrencyEntity>> getCriptocurrency(
      List<String> currencyIdsList) {
    return datasource.getCriptocurrencies(currencyIdsList);
  }
}
