import 'package:clean_architecture/domain/entities/_entities.lib.dart';
import 'package:clean_architecture/presentation/controllers/criptocurrencies_bloc/criptocurrencies_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';

class MockBuildContext extends Mock implements BuildContext {}

class MockCriptoCurrencyLoadingBloc extends CriptoCurrencyLoadingBloc {
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
  late MockCriptoCurrencyLoadingBloc sut;
  late MockBuildContext context;

  setUp(() {
    sut = MockCriptoCurrencyLoadingBloc();
    context = MockBuildContext();
  });

  group('Criptocurrencies Bloc', () {
    blocTest<MockCriptoCurrencyLoadingBloc, CriptoCurrencyListStateEntity>(
      'It emits nothing because the first state isLoading',
      build: () => sut,
      act: (bloc) => bloc.criptocurrenciesLoading(
          criptoCurrencyListStateEntity:
              const CriptoCurrencyListStateEntity(isLoading: true)),
      expect: () => const <CriptoCurrencyListStateEntity>[],
    );
    blocTest<MockCriptoCurrencyLoadingBloc, CriptoCurrencyListStateEntity>(
      'It emits a list of criptocurrencies',
      build: () => sut,
      act: (bloc) => bloc.criptocurrenciesLoading(
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
    blocTest<CriptoCurrencyLoadingBloc, CriptoCurrencyListStateEntity>(
      'It emits a list of criptocurrencies using criptocurrenciesLoading function',
      build: () => sut,
      act: (bloc) => bloc.loadNextCriptocurrencyData(context: context),
      expect: () => <CriptoCurrencyListStateEntity>[
        CriptoCurrencyListStateEntity(listCriptoCurrency: [
          CriptocurrencyEntity(
              name: 'Bitcoin', symbol: 'btc', price: 26000, restError: null),
        ]),
      ],
    );
  });
}
