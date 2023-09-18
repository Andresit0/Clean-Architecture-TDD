import 'package:clean_architecture/domain/entities/_entities.lib.dart';
import 'package:clean_architecture/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/variables/_variable.lib.dart';
import '../../../infrastructure/datasources/_datasources.lib.dart';
import '../../../infrastructure/repositories/_repositories.lib.dart';

part 'criptocurrencies_event.dart';

class CriptoCurrencyLoadingBloc
    extends Bloc<CriptoCurrencyLoadingEvent, CriptoCurrencyListStateEntity> {
  CriptoCurrencyLoadingBloc()
      : super(const CriptoCurrencyListStateEntity(isLoading: true)) {
    on<LoadNextCriptocurrencyData>(_loadNextCriptocurrencyData);
    on<CriptocurrenciesLoading>(_criptocurrenciesLoading);
  }
  _loadNextCriptocurrencyData(LoadNextCriptocurrencyData event,
      Emitter<CriptoCurrencyListStateEntity> emit) async {
    final criptocurrencyRepositoryImp =
        CriptocurrencyRepositoryImp(CriptocurrencyDatasourceImp());
    CriptoCurrencyListStateEntity response =
        await criptocurrencyRepositoryImp.getCriptocurrency(
      currencyIdsList: event.currencyIDs ??
          CustomVariables.constCriptocurrencyList.criptocurrenciesMostKnowledge,
      context: event.context,
    );
    MyApp.criptoCurrencyLoadingBloc.criptocurrenciesLoading(
        criptoCurrencyListStateEntity:
            const CriptoCurrencyListStateEntity(isLoading: true));
    // Or
    // BlocProvider.of<CriptoCurrencyLoadingBloc>(event.context, listen: false)
    //     .add(CriptocurrenciesLoading(
    //         criptoCurrencyListStateEntity:
    //             const CriptoCurrencyListStateEntity(isLoading: true)));
    await Future.delayed(const Duration(seconds: 4), () {
      MyApp.criptoCurrencyLoadingBloc
          .criptocurrenciesLoading(criptoCurrencyListStateEntity: response);
      //Or
      // BlocProvider.of<CriptoCurrencyLoadingBloc>(event.context, listen: false)
      //     .add(
      //         CriptocurrenciesLoading(criptoCurrencyListStateEntity: response));
    });
  }

  _criptocurrenciesLoading(CriptocurrenciesLoading event,
      Emitter<CriptoCurrencyListStateEntity> emit) {
    if (state != event.criptoCurrencyListStateEntity) {
      emit(event.criptoCurrencyListStateEntity);
    }
  }

  void loadNextCriptocurrencyData(
          {List<String>? currencyIDs, required BuildContext context}) =>
      add(LoadNextCriptocurrencyData(
          currencyIDs: currencyIDs, context: context));

  void criptocurrenciesLoading(
          {required CriptoCurrencyListStateEntity
              criptoCurrencyListStateEntity}) =>
      add(CriptocurrenciesLoading(
          criptoCurrencyListStateEntity: criptoCurrencyListStateEntity));
}
