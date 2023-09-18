import 'package:clean_architecture/domain/entities/_entities.lib.dart';
import 'package:clean_architecture/presentation/controllers/criptocurrencies_cubit/criptocurrencies_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';

class MockBuildContext extends Mock implements BuildContext {}

class MockCriptocurrenciesCubitController
    extends CriptocurrenciesCubitController {
  @override
  loadNextCriptocurrencyData(
      {List<String>? currencyIDs, required BuildContext context}) {
    criptocurrenciesLoading(
        criptoCurrencyListStateEntity:
            CriptoCurrencyListStateEntity(listCriptoCurrency: [
      CriptocurrencyEntity(
          name: 'Bitcoin', symbol: 'btc', price: 26000, restError: null),
    ]));
  }
}

void main() {
  late MockCriptocurrenciesCubitController sut;
  late MockBuildContext context;

  setUp(() {
    sut = MockCriptocurrenciesCubitController();
    context = MockBuildContext();
  });

  group('Criptocurrencies Cubit', () {
    blocTest<CriptocurrenciesCubitController, CriptoCurrencyListStateEntity>(
      'It emits nothing because the first state isLoading (due if statement)',
      build: () => sut,
      act: (cubit) => cubit.criptocurrenciesLoading(
          criptoCurrencyListStateEntity:
              const CriptoCurrencyListStateEntity(isLoading: true)),
      expect: () => const <CriptoCurrencyListStateEntity>[],
    );
    blocTest<CriptocurrenciesCubitController, CriptoCurrencyListStateEntity>(
      'It emits a list of criptocurrencies',
      build: () => sut,
      act: (cubit) => cubit.criptocurrenciesLoading(
          criptoCurrencyListStateEntity:
              CriptoCurrencyListStateEntity(listCriptoCurrency: [
        CriptocurrencyEntity(
            name: 'Bitcoin', symbol: 'btc', price: 26000, restError: null),
      ])),
      expect: () => <CriptoCurrencyListStateEntity>[
        CriptoCurrencyListStateEntity(listCriptoCurrency: [
          CriptocurrencyEntity(
              name: 'Bitcoin', symbol: 'btc', price: 26000, restError: null),
        ]),
      ],
    );
    blocTest<CriptocurrenciesCubitController, CriptoCurrencyListStateEntity>(
      'It emits a list of criptocurrencies using criptocurrenciesLoading function',
      build: () => sut,
      act: (cubit) => cubit.loadNextCriptocurrencyData(context: context),
      expect: () => <CriptoCurrencyListStateEntity>[
        CriptoCurrencyListStateEntity(listCriptoCurrency: [
          CriptocurrencyEntity(
              name: 'Bitcoin', symbol: 'btc', price: 26000, restError: null),
        ]),
      ],
    );
  });
}
