import 'dart:convert';

import 'package:clean_architecture/domain/entities/_entities.lib.dart';
import 'package:clean_architecture/infrastructure/datasources/_datasources.lib.dart';
import 'package:clean_architecture/infrastructure/mappers/_mappers.lib.dart';
import 'package:clean_architecture/infrastructure/models/_models.lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../fixtures/fixture_reader.dart';
import 'criptocurrency_datasource_imp_test.mocks.dart';

@GenerateMocks([CriptocurrencyDatasourceImp, BuildContext, RestErrorEntity])
void main() {
  late MockCriptocurrencyDatasourceImp sut;
  late MockBuildContext context;
  setUp(() {
    sut = MockCriptocurrencyDatasourceImp();
    context = MockBuildContext();
  });
  group('Obtain criptocrrencies from service', () {
    final List<String> currencyIdsList = ['bitcoin', 'ethereum'];
    final List<dynamic> mockResultFromServer =
        json.decode(fixture('get_criptocurrencies'));
    CriptoCurrencyListStateEntity listCriptoCurrency =
        CriptoCurrencyListStateEntity(listCriptoCurrency: [
      CriptocurrencyEntity(
          name: 'Bitcoin', symbol: 'btc', price: 25857, restError: null),
      CriptocurrencyEntity(
          name: 'Ethereum', symbol: 'eth', price: 1738.02, restError: null),
    ]);

    test('Success', () async {
      when(sut.getCriptocurrencies(
              currencyIdsList: currencyIdsList, context: context))
          .thenAnswer((realInvocation) async => CriptoCurrencyListStateEntity(
                listCriptoCurrency: mockResultFromServer
                    .map<CriptocurrencyEntity>((json) =>
                        CriptocurrencyMapper.criptocurrencyToEntity(
                            criptocurrencyCoingeckoModel:
                                CriptocurrencyCoingeckoModel.fromJson(json)))
                    .toList(),
              ));
      CriptoCurrencyListStateEntity listCriptoCurrencyFromMockServer =
          await sut.getCriptocurrencies(
              currencyIdsList: currencyIdsList, context: context);
      expect(listCriptoCurrencyFromMockServer, listCriptoCurrency);
    });

    test('Failure', () async {
      CriptoCurrencyListStateEntity listCriptoCurrencyHttpError =
          CriptoCurrencyListStateEntity(httpError: MockRestErrorEntity());
      when(sut.getCriptocurrencies(
              currencyIdsList: currencyIdsList, context: context))
          .thenAnswer((realInvocation) async =>
              CriptoCurrencyListStateEntity(httpError: MockRestErrorEntity()));
      CriptoCurrencyListStateEntity httpErrorFromMockServer =
          await sut.getCriptocurrencies(
              currencyIdsList: currencyIdsList, context: context);
      expect(httpErrorFromMockServer.isLoading,
          listCriptoCurrencyHttpError.isLoading);
      expect(httpErrorFromMockServer.listCriptoCurrency,
          listCriptoCurrencyHttpError.listCriptoCurrency);
      expect(
          httpErrorFromMockServer.httpError.toString() ==
              listCriptoCurrencyHttpError.httpError.toString(),
          true);
    });
  });
}
