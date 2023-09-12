import 'package:clean_architecture/domain/entities/_entities.lib.dart';
import 'package:clean_architecture/presentation/screens/_screen.lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import '../../../testing/_testing.lib.dart';
import 'criptocurrencies_test.mocks.dart';

@GenerateMocks([BuildContext])
void main() {
  late CriptocurrenciesView wut;
  late MockBuildContext context;
  setUp(() {
    wut = const CriptocurrenciesView(
      criptocurrrencies: CriptoCurrencyListStateEntity(isLoading: true),
    );
    context = MockBuildContext();
  });

  Widget testingWidget() {
    return mockMyApp(home: wut);
  }

  group('CriptocurrenciesVie evaluation', () {
    testWidgets(
      "Evaluation of circular progress indicator",
      (WidgetTester tester) async {
        WidgetsFlutterBinding.ensureInitialized();
        await tester.pumpWidget(testingWidget());
        expect(
            find.byKey(const Key('circularProgressIndicator')), findsOneWidget);
      },
    );
    testWidgets(
      "Evaluation of Error",
      (WidgetTester tester) async {
        wut = CriptocurrenciesView(
          criptocurrrencies: CriptoCurrencyListStateEntity(
              httpError: RestErrorEntity(
            context: context,
            exception: Exception('testing error'),
            errorMessage: 'testing error',
            stackTrace:
                'test/presentation/screens/views/criptocurrencies_test.dart',
            httpPath: 'testing error httpPath',
            httpBodyResponse: 'testing error',
          )),
        );
        WidgetsFlutterBinding.ensureInitialized();
        await tester.pumpWidget(testingWidget());
        expect(find.byKey(const Key('httpError')), findsOneWidget);
      },
    );
    testWidgets(
      "Evaluation of table",
      (WidgetTester tester) async {
        wut = CriptocurrenciesView(
          criptocurrrencies: CriptoCurrencyListStateEntity(listCriptoCurrency: [
            CriptocurrencyEntity(
                name: 'Bitcoin', symbol: 'btc', price: 30000, restError: null),
          ]),
        );
        WidgetsFlutterBinding.ensureInitialized();
        await tester.pumpWidget(testingWidget());
        expect(
            find.byKey(const Key('tableWithCriptocurrencies')), findsOneWidget);
        expect(find.bySemanticsLabel('Bitcoin'), findsOneWidget);
      },
    );
  });
}
