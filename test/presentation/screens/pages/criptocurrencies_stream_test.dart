import 'package:clean_architecture/domain/entities/_entities.lib.dart';
import 'package:clean_architecture/main.dart';
import 'package:clean_architecture/presentation/screens/pages/criptocurrencies_stream.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget testingWidget() {
    CriptocurrenciesStreamPage.reload = false;
    CriptocurrenciesStreamPage.mockResponse =
        CriptoCurrencyListStateEntity(listCriptoCurrency: [
      CriptocurrencyEntity(
          name: 'Bitcoin', symbol: 'btc', price: 26000, restError: null),
    ]);
    return const MyApp();
  }

  group('Stream Evaluation', () {
    testWidgets('Show Circular Progres Indicator', (WidgetTester tester) async {
      WidgetsFlutterBinding.ensureInitialized();
      await tester.pumpWidget(testingWidget());
      final Finder fab = find.bySemanticsLabel('Stream');
      await tester.tap(fab);
      await tester.pump();
      await tester.pump(const Duration(microseconds: 1000));
      expect(
          find.byKey(const Key('circularProgressIndicator')), findsOneWidget);
      await tester.pumpAndSettle();
    });
    testWidgets('Review Criptocurrency Table', (WidgetTester tester) async {
      await tester.pumpWidget(testingWidget());
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('circularProgressIndicator')), findsNothing);
      expect(find.text('Name'), findsNWidgets(1));
      expect(find.text('Price'), findsNWidgets(1));
      expect(find.text('Symbol'), findsNWidgets(1));
      expect(find.text('Bitcoin'), findsNWidgets(1));
      expect(find.text('26000.0'), findsNWidgets(1));
    });
  });
}
