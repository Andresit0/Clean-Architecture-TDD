import 'package:clean_architecture/domain/entities/_entities.lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/variables/_variable.lib.dart';
import '../../../../infrastructure/datasources/_datasources.lib.dart';
import '../../../../infrastructure/repositories/_repositories.lib.dart';
import '../../../../main.dart';

class CriptocurrenciesCubitController
    extends Cubit<CriptoCurrencyListStateEntity> {
  CriptocurrenciesCubitController()
      : super(const CriptoCurrencyListStateEntity(isLoading: true));

  void loadNextCriptocurrencyData({
    List<String>? currencyIDs,
    required BuildContext context,
  }) async {
    final criptocurrencyRepositoryImp =
        CriptocurrencyRepositoryImp(CriptocurrencyDatasourceImp());
    CriptoCurrencyListStateEntity response =
        await criptocurrencyRepositoryImp.getCriptocurrency(
      currencyIdsList: currencyIDs ??
          CustomVariables.constCriptocurrencyList.criptocurrenciesMostKnowledge,
      context: context,
    );
    MyApp.criptocurrenciesCubit.criptocurrenciesLoading(
        criptoCurrencyListStateEntity:
            const CriptoCurrencyListStateEntity(isLoading: true));
    await Future.delayed(const Duration(seconds: 4), () {
      MyApp.criptocurrenciesCubit
          .criptocurrenciesLoading(criptoCurrencyListStateEntity: response);
    });
  }

  void criptocurrenciesLoading(
      {required CriptoCurrencyListStateEntity criptoCurrencyListStateEntity}) {
    emit(criptoCurrencyListStateEntity);
  }
}
