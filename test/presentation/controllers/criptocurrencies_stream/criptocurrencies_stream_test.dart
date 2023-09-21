import 'package:clean_architecture/domain/entities/_entities.lib.dart';
import 'package:clean_architecture/presentation/controllers/criptocurrencies_stream/criptocurrencies_stream.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockBuildContext extends Mock implements BuildContext {}

void main() {
  late MockBuildContext context;

  setUp(() {
    context = MockBuildContext();
  });
  group('Stream Evaluation', () {
    CriptoCurrencyListStateEntity criptoCurrencyListStateEntity =
        CriptoCurrencyListStateEntity(listCriptoCurrency: [
      CriptocurrencyEntity(
          name: 'Bitcoin', symbol: 'btc', price: 26000, restError: null),
    ]);
    test("Observing that criptocurrenciesLoading change the state", () async {
      CriptocurrenciesStreamController.criptocurrenciesLoading(
          newCriptoCurrencyListStateEntity: criptoCurrencyListStateEntity);
      expect(CriptocurrenciesStreamController.lastCriptoCurrencyListStateEntity,
          criptoCurrencyListStateEntity);
      CriptocurrenciesStreamController.criptocurrenciesLoading(
          newCriptoCurrencyListStateEntity:
              const CriptoCurrencyListStateEntity(isLoading: true));
      expect(CriptocurrenciesStreamController.lastCriptoCurrencyListStateEntity,
          const CriptoCurrencyListStateEntity(isLoading: true));
    });

    test('Observing that loadNextCriptocurrencyData is working', () async {
      await CriptocurrenciesStreamController.loadNextCriptocurrencyData(
          context: context, mockResponse: criptoCurrencyListStateEntity);
      expect(CriptocurrenciesStreamController.lastCriptoCurrencyListStateEntity,
          criptoCurrencyListStateEntity);
    });
  });
}
