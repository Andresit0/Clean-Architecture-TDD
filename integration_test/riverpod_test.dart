import 'package:clean_architecture/domain/entities/_entities.lib.dart';
import 'package:clean_architecture/main.dart';
import 'package:clean_architecture/presentation/controllers/criptocurrencies_riverpod/_criptocurrencies_riverpod.lib.dart';
import 'package:clean_architecture/presentation/screens/_screen.lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

CriptoCurrencyListStateEntity criptoCurrencyListStateEntity =
    CriptoCurrencyListStateEntity(listCriptoCurrency: [
  CriptocurrencyEntity(
      name: 'Bitcoin', symbol: 'btc', price: 25857, restError: null),
  CriptocurrencyEntity(
      name: 'Ethereum', symbol: 'eth', price: 1738.02, restError: null),
]);

MockCriptocurrenciesLoadingNotifier mockCriptocurrenciesLoadingNotifier =
    MockCriptocurrenciesLoadingNotifier();

class MockRef extends Mock
    implements
        StateNotifierProviderRef<CriptocurrenciesNotifier,
            CriptoCurrencyListStateEntity> {}

class MockCriptocurrenciesLoadingNotifier
    extends CriptocurrenciesLoadingNotifier {
  @override
  CriptoCurrencyListStateEntity get state =>
      const CriptoCurrencyListStateEntity(isLoading: true);
}

class MockCriptocurrenciesNotifier extends CriptocurrenciesNotifier {
  MockCriptocurrenciesNotifier({required super.ref});

  @override
  CriptoCurrencyListStateEntity get state => criptoCurrencyListStateEntity;

  @override
  Future<CriptoCurrencyListStateEntity> loadNextCriptocurrencyData(
      {List<String>? currencyIDs, required BuildContext context}) async {
    await Future.delayed(const Duration(seconds: 2));
    state = criptoCurrencyListStateEntity;
    mockCriptocurrenciesLoadingNotifier.state = criptoCurrencyListStateEntity;
    return criptoCurrencyListStateEntity;
  }
}

void main() {
  late MockCriptocurrenciesNotifier mockCriptocurrenciesNotifier;
  late MockRef ref;
  setUp(() {
    ref = MockRef();
    mockCriptocurrenciesNotifier = MockCriptocurrenciesNotifier(ref: ref);
  });

  Widget testingWidget() {
    return ProviderScope(
      overrides: [
        getCriptocurrenciesLoadingProvider
            .overrideWith((ref) => mockCriptocurrenciesLoadingNotifier),
        getCriptocurrenciesProvider
            .overrideWith((ref) => mockCriptocurrenciesNotifier),
      ],
      child: const MyApp(),
    );
  }

  group('Riverpod Evaluation', () {
    testWidgets('Show Circular Progres Indicator', (WidgetTester tester) async {
      WidgetsFlutterBinding.ensureInitialized();
      CriptocurrenciesRiverpodPageCtrl.reload = false;
      await tester.pumpWidget(testingWidget());
      final Finder fab = find.bySemanticsLabel('Riverpod');
      await tester.tap(fab);
      await tester.pump();
      await tester.pump(const Duration(microseconds: 1000));
      //Option 1
      // await tester.pumpFrames(
      //     const CircularProgressIndicator(
      //         key: Key('circularProgressIndicator')),
      //     const Duration(microseconds: 500, milliseconds: 600));
      //Option 2
      expect(
          find.byKey(const Key('circularProgressIndicator')), findsOneWidget);
      await tester.pumpAndSettle();
    });

    testWidgets('Review Criptocurrency Table', (WidgetTester tester) async {
      mockCriptocurrenciesLoadingNotifier =
          MockCriptocurrenciesLoadingNotifier();
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
