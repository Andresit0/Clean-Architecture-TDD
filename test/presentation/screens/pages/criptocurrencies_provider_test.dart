import 'package:clean_architecture/domain/entities/_entities.lib.dart';
import 'package:clean_architecture/main.dart';
import 'package:clean_architecture/presentation/controllers/criptocurrencies_provider/criptocurrencies_provider.dart';
import 'package:clean_architecture/presentation/screens/pages/criptocurrencies_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  Widget testingWidget() {
    Provider.debugCheckInvalidValueType = null;
    CriptocurrenciesProviderPage.reload = false;
    CriptocurrenciesProviderPage.mockResponse =
        CriptoCurrencyListStateEntity(listCriptoCurrency: [
      CriptocurrencyEntity(
          name: 'Bitcoin', symbol: 'btc', price: 26000, restError: null),
    ]);
    return const MyApp();
  }

  group('Testing provider page', () {
    testWidgets(
      "Testing that loading widget is showed",
      (WidgetTester tester) async {
        await tester.pumpWidget(testingWidget());
        final Finder fab = find.bySemanticsLabel('Provider');
        await tester.tap(fab);
        await tester.pump();
        await tester.pump(const Duration(microseconds: 2000));
        expect(
            find.byKey(const Key('circularProgressIndicator')), findsOneWidget);
        await tester.pumpAndSettle();
      },
    );
    testWidgets('Review Criptocurrency Table', (WidgetTester tester) async {
      MyApp.criptocurrenciesProviderController =
          CriptocurrenciesProviderController();
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
