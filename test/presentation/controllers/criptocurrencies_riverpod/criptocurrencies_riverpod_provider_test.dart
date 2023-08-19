import 'package:clean_architecture/domain/entities/_entities.lib.dart';
import 'package:clean_architecture/presentation/controllers/criptocurrencies_riverpod/_criptocurrencies_riverpod.lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mocktail/mocktail.dart';

class MockBuildContext extends Mock implements BuildContext {}

class MockCriptocurrenciesNotifier extends Mock
    implements CriptocurrenciesNotifier {
  CriptoCurrencyListStateEntity state2 =
      const CriptoCurrencyListStateEntity(isLoading: true);
  @override
  set state(CriptoCurrencyListStateEntity criptoCurrencyListStateEntity) {
    state2 = criptoCurrencyListStateEntity;
  }

  @override
  get state => state2;
}

class Listener<T> extends Mock {
  void call(T? previous, T next);
}

void main() {
  late CriptoCurrencyListStateEntity criptoCurrencyListStateEntity;
  late MockBuildContext context;
  setUp(() {
    context = MockBuildContext();
    criptoCurrencyListStateEntity =
        CriptoCurrencyListStateEntity(listCriptoCurrency: [
      CriptocurrencyEntity(
          name: 'Bitcoin', symbol: 'btc', price: 25857, restError: null),
      CriptocurrencyEntity(
          name: 'Ethereum', symbol: 'eth', price: 1738.02, restError: null),
    ]);
  });

  group('Providers Evaluation', () {
    test(
        'getCriptocurrenciesLoadingProvider: Loading true before loaded with real provider',
        () {
      var container = ProviderContainer();
      final listener = Listener<CriptoCurrencyListStateEntity>();
      container.listen<CriptoCurrencyListStateEntity>(
        getCriptocurrenciesLoadingProvider,
        listener,
        fireImmediately: true,
      );
      var provider =
          container.read(getCriptocurrenciesLoadingProvider.notifier);
      expect(
          provider.state, const CriptoCurrencyListStateEntity(isLoading: true));
      provider.newCriptoCurrencyListStateEntity(criptoCurrencyListStateEntity);
      expect(provider.state, criptoCurrencyListStateEntity);
    });
    test(
        'getCriptocurrenciesProvider: load new cripto currency data with mock provider',
        () async {
      final mockSharedPreferences = MockCriptocurrenciesNotifier();
      when(() => mockSharedPreferences.loadNextCriptocurrencyData(
          context: context)).thenAnswer((invocation) async {
        mockSharedPreferences.state = criptoCurrencyListStateEntity;
        return criptoCurrencyListStateEntity;
      });
      expect(mockSharedPreferences.state.isLoading, true);
      var result = await mockSharedPreferences.loadNextCriptocurrencyData(
          context: context);
      expect(mockSharedPreferences.state, criptoCurrencyListStateEntity);
      expect(result, criptoCurrencyListStateEntity);
    });
  });
}
//Future.value(criptoCurrencyListStateEntity)