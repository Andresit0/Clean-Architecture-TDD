import 'package:clean_architecture/domain/entities/_entities.lib.dart';
import 'package:clean_architecture/presentation/controllers/criptocurrencies_provider/criptocurrencies_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockBuildContext extends Mock implements BuildContext {}

class MockCriptocurrenciesProviderController
    extends CriptocurrenciesProviderController {
  @override
  loadNextCriptocurrencyData({
    List<String>? currencyIDs,
    required BuildContext context,
    CriptoCurrencyListStateEntity? mockResponse,
  }) {
    criptocurrenciesLoading(
        newCriptoCurrencyListStateEntity:
            CriptoCurrencyListStateEntity(listCriptoCurrency: [
      CriptocurrencyEntity(
          name: 'Bitcoin', symbol: 'btc', price: 26000, restError: null),
    ]));
  }
}

void main() {
  late MockCriptocurrenciesProviderController sut;
  late MockBuildContext context;

  setUp(() {
    sut = MockCriptocurrenciesProviderController();
    context = MockBuildContext();
  });

  group('Criptocurrencies Provider Evaluation', () {
    test("It emits loading state as init state", () {
      expect(sut.criptoCurrencyListStateEntity,
          const CriptoCurrencyListStateEntity(isLoading: true));
    });
    test("The method criptocurrenciesLoading change the state", () {
      sut.criptocurrenciesLoading(
          newCriptoCurrencyListStateEntity:
              CriptoCurrencyListStateEntity(listCriptoCurrency: [
        CriptocurrencyEntity(
            name: 'Bitcoin', symbol: 'btc', price: 26000, restError: null),
      ]));
      expect(
          sut.criptoCurrencyListStateEntity,
          CriptoCurrencyListStateEntity(listCriptoCurrency: [
            CriptocurrencyEntity(
                name: 'Bitcoin', symbol: 'btc', price: 26000, restError: null),
          ]));
    });
    test('Evaluation of mock loadNextCriptocurrencyData method', () {
      sut.loadNextCriptocurrencyData(context: context);
      expect(
          sut.criptoCurrencyListStateEntity,
          CriptoCurrencyListStateEntity(listCriptoCurrency: [
            CriptocurrencyEntity(
                name: 'Bitcoin', symbol: 'btc', price: 26000, restError: null),
          ]));
    });
  });
}
