import 'package:clean_architecture/domain/entities/_entities.lib.dart';
import 'package:clean_architecture/main.dart';
import 'package:clean_architecture/presentation/controllers/criptocurrencies_riverpod_2.0/criptocurrencies_loading_riverpod2.0.dart';
import 'package:clean_architecture/presentation/controllers/criptocurrencies_riverpod_2.0/criptocurrencies_riverpod2.0.dart';
import 'package:clean_architecture/presentation/screens/_screen.lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

CriptoCurrencyListStateEntity criptoCurrencyListStateEntity =
    CriptoCurrencyListStateEntity(listCriptoCurrency: [
  CriptocurrencyEntity(
      name: 'Bitcoin', symbol: 'btc', price: 25857, restError: null),
  CriptocurrencyEntity(
      name: 'Ethereum', symbol: 'eth', price: 1738.02, restError: null),
]);

MockCriptocurrenciesLoadingRiverpod2 mockCriptocurrenciesLoadingRiverpod2 =
    MockCriptocurrenciesLoadingRiverpod2();

class MockCriptocurrenciesLoadingRiverpod2
    extends CriptocurrenciesLoadingRiverpod2 {
  @override
  CriptoCurrencyListStateEntity get state =>
      const CriptoCurrencyListStateEntity(isLoading: true);
}

class MockCriptocurrenciesRiverpod2 extends CriptocurrenciesRiverpod2 {
  @override
  CriptoCurrencyListStateEntity get state => criptoCurrencyListStateEntity;

  @override
  Future<CriptoCurrencyListStateEntity> loadNextCriptocurrencyData(
      {List<String>? currencyIDs, required BuildContext context}) async {
    await Future.delayed(const Duration(seconds: 2));
    state = criptoCurrencyListStateEntity;
    mockCriptocurrenciesLoadingRiverpod2.state = criptoCurrencyListStateEntity;
    return criptoCurrencyListStateEntity;
  }
}

void main() {
  late MockCriptocurrenciesRiverpod2 mockCriptocurrenciesRiverpod2;
  setUp(() {
    mockCriptocurrenciesRiverpod2 = MockCriptocurrenciesRiverpod2();
  });

  Widget testingWidget() {
    return ProviderScope(
      overrides: [
        criptocurrenciesLoadingRiverpod2Provider
            .overrideWith(() => mockCriptocurrenciesLoadingRiverpod2),
        criptocurrenciesRiverpod2Provider
            .overrideWith(() => mockCriptocurrenciesRiverpod2),
      ],
      child: const MyApp(),
    );
  }

  group('Riverpod 2.0 Evaluation', () {
    testWidgets('Show Circular Progres Indicator', (WidgetTester tester) async {
      WidgetsFlutterBinding.ensureInitialized();
      CriptocurrenciesRiverpod2PageCtrl.reload = false;
      await tester.pumpWidget(testingWidget());
      final Finder fab = find.bySemanticsLabel('Riverpod 2.0');
      await tester.tap(fab);
      //Option 1
      // await tester.pumpFrames(
      //     const CircularProgressIndicator(
      //         key: Key('circularProgressIndicator')),
      //     const Duration(microseconds: 500, milliseconds: 600));
      // expect(
      //     find.byKey(const Key('circularProgressIndicator')), findsOneWidget);
      //Option 2
      await tester.pump();
      await tester.pump(const Duration(microseconds: 1000));
      expect(
          find.byKey(const Key('circularProgressIndicator')), findsOneWidget);
      await tester.pumpAndSettle();
    });

    testWidgets('Review Criptocurrency Table', (WidgetTester tester) async {
      mockCriptocurrenciesLoadingRiverpod2 =
          MockCriptocurrenciesLoadingRiverpod2();
      await tester.pumpWidget(testingWidget());
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('circularProgressIndicator')), findsNothing);
      expect(find.text('Name'), findsNWidgets(1));
      expect(find.text('Price'), findsNWidgets(1));
      expect(find.text('Symbol'), findsNWidgets(1));
      expect(find.text('Bitcoin'), findsNWidgets(1));
      expect(find.text('25857.0'), findsNWidgets(1));
    });
  });
}
