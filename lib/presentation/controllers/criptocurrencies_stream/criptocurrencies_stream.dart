import 'dart:async';

import 'package:flutter/material.dart';

import '../../../config/variables/_variable.lib.dart';
import '../../../domain/entities/_entities.lib.dart';
import '../../../infrastructure/datasources/_datasources.lib.dart';
import '../../../infrastructure/repositories/_repositories.lib.dart';

class CriptocurrenciesStreamController {
  static CriptoCurrencyListStateEntity lastCriptoCurrencyListStateEntity =
      const CriptoCurrencyListStateEntity(isLoading: true);

  static StreamController<CriptoCurrencyListStateEntity>
      criptoCurrencyListStateEntity = StreamController.broadcast()
        ..add(lastCriptoCurrencyListStateEntity);

  static void criptocurrenciesLoading(
      {required CriptoCurrencyListStateEntity
          newCriptoCurrencyListStateEntity}) {
    criptoCurrencyListStateEntity.add(
        lastCriptoCurrencyListStateEntity = newCriptoCurrencyListStateEntity);
  }

  static Future<void> loadNextCriptocurrencyData({
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
    criptoCurrencyListStateEntity.add(lastCriptoCurrencyListStateEntity =
        const CriptoCurrencyListStateEntity(isLoading: true));
    await Future.delayed(const Duration(seconds: 4), () {
      criptoCurrencyListStateEntity
          .add(lastCriptoCurrencyListStateEntity = response);
    });
  }
}
