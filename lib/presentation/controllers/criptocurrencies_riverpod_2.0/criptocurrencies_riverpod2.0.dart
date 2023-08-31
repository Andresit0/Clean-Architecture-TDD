import 'package:clean_architecture/presentation/controllers/criptocurrencies_riverpod_2.0/criptocurrencies_loading_riverpod2.0.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../config/variables/_variable.lib.dart';
import '../../../domain/entities/_entities.lib.dart';
import '../../../infrastructure/datasources/_datasources.lib.dart';
import '../../../infrastructure/repositories/_repositories.lib.dart';

part 'criptocurrencies_riverpod2.0.g.dart';

final criptocurrenciesRepositoryProvider = Provider(
    (ref) => CriptocurrencyRepositoryImp(CriptocurrencyDatasourceImp()));

@riverpod
class CriptocurrenciesRiverpod2 extends _$CriptocurrenciesRiverpod2 {
  @override
  CriptoCurrencyListStateEntity build() {
    return const CriptoCurrencyListStateEntity(isLoading: true);
  }

  Future<CriptoCurrencyListStateEntity> loadNextCriptocurrencyData(
      {List<String>? currencyIDs, required BuildContext context}) async {
    final getCriptocurrency =
        ref.watch(criptocurrenciesRepositoryProvider).getCriptocurrency;
    ref
        .read(criptocurrenciesLoadingRiverpod2Provider.notifier)
        .newCriptoCurrencyListStateEntity(
            CriptoCurrencyListStateEntity(isLoading: true));

    CriptoCurrencyListStateEntity response = await getCriptocurrency(
        currencyIdsList: currencyIDs ??
            CustomVariables
                .constCriptocurrencyList.criptocurrenciesMostKnowledge,
        context: context);

    state = response;

    await Future.delayed(const Duration(seconds: 2), () {
      ref
          .read(criptocurrenciesLoadingRiverpod2Provider.notifier)
          .newCriptoCurrencyListStateEntity(response);
    });

    return response;
  }
}
