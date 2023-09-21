import 'package:flutter/material.dart';

import '../../../config/variables/_variable.lib.dart';
import '../../../domain/entities/_entities.lib.dart';
import '../../../infrastructure/datasources/_datasources.lib.dart';
import '../../../infrastructure/repositories/_repositories.lib.dart';

class CriptocurrenciesProviderController with ChangeNotifier {
  CriptoCurrencyListStateEntity _criptoCurrencyListStateEntity =
      const CriptoCurrencyListStateEntity(isLoading: true);

  CriptoCurrencyListStateEntity get criptoCurrencyListStateEntity =>
      _criptoCurrencyListStateEntity;

  set criptoCurrencyListStateEntity(
      CriptoCurrencyListStateEntity newCriptoCurrencyListStateEntity) {
    _criptoCurrencyListStateEntity = newCriptoCurrencyListStateEntity;
    notifyListeners();
  }

  void criptocurrenciesLoading(
      {required CriptoCurrencyListStateEntity
          newCriptoCurrencyListStateEntity}) {
    if (criptoCurrencyListStateEntity != newCriptoCurrencyListStateEntity) {
      criptoCurrencyListStateEntity = newCriptoCurrencyListStateEntity;
    }
  }

  void loadNextCriptocurrencyData({
    List<String>? currencyIDs,
    required BuildContext context,
    CriptoCurrencyListStateEntity? mockResponse,
  }) async {
    final criptocurrencyRepositoryImp =
        CriptocurrencyRepositoryImp(CriptocurrencyDatasourceImp());
    CriptoCurrencyListStateEntity response = mockResponse ??
        await criptocurrencyRepositoryImp.getCriptocurrency(
          currencyIdsList: currencyIDs ??
              CustomVariables
                  .constCriptocurrencyList.criptocurrenciesMostKnowledge,
          context: context,
        );
    criptoCurrencyListStateEntity =
        const CriptoCurrencyListStateEntity(isLoading: true);
    await Future.delayed(const Duration(seconds: 4), () {
      criptoCurrencyListStateEntity = response;
    });
  }
}
