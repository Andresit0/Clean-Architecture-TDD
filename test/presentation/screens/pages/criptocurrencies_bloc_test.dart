import 'package:bloc_test/bloc_test.dart';
import 'package:clean_architecture/domain/entities/_entities.lib.dart';
import 'package:clean_architecture/main.dart';
import 'package:clean_architecture/presentation/controllers/criptocurrencies_bloc/criptocurrencies_bloc.dart';
import 'package:clean_architecture/presentation/screens/pages/criptocurrencies_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class MockCriptoCurrencyLoadingBloc
    extends MockBloc<CriptoCurrencyLoadingEvent, CriptoCurrencyListStateEntity>
    implements CriptoCurrencyLoadingBloc {}

void main() {
  late MockCriptoCurrencyLoadingBloc sut;

  setUp(() {
    sut = MockCriptoCurrencyLoadingBloc();
  });

  Widget testingWidget() {
    CriptocurrenciesBloc.reload = false;
    MyApp.criptoCurrencyLoadingBloc = sut;
    return const MyApp();
  }

  List<CriptoCurrencyListStateEntity> criptoCurrencyListStateEntity = [
    const CriptoCurrencyListStateEntity(isLoading: true),
    CriptoCurrencyListStateEntity(listCriptoCurrency: [
      CriptocurrencyEntity(
          name: 'Bitcoin', symbol: 'btc', price: 26000, restError: null),
    ]),
  ];

  group('Testing bloc page', () {
    testWidgets(
      "Testing that loading widget is showed",
      (WidgetTester tester) async {
        int index = 0;
        whenListen(
          sut,
          Stream.periodic(const Duration(seconds: 4), (_) {
            return criptoCurrencyListStateEntity[index++];
          }).take(2),
          initialState: const CriptoCurrencyListStateEntity(isLoading: true),
        );
        await tester.runAsync(() async {
          await tester.pumpWidget(testingWidget());
          final Finder fab = find.bySemanticsLabel('Bloc');
          await tester.tap(fab);
          await tester.pump();
          await tester.pump(const Duration(milliseconds: 2000));
          expect(find.byKey(const Key('circularProgressIndicator')),
              findsOneWidget);
        });
      },
    );
    testWidgets('Review Criptocurrency Table', (WidgetTester tester) async {
      whenListen(
        sut,
        Stream.fromIterable([
          CriptoCurrencyListStateEntity(listCriptoCurrency: [
            CriptocurrencyEntity(
                name: 'Bitcoin', symbol: 'btc', price: 26000, restError: null),
          ]),
        ]),
        initialState: const CriptoCurrencyListStateEntity(isLoading: true),
      );
      await tester.runAsync(() async {
        await tester.pumpWidget(testingWidget());
        await tester.pumpAndSettle();
        expect(
            find.byKey(const Key('circularProgressIndicator')), findsNothing);
        expect(find.text('Name'), findsNWidgets(1));
        expect(find.text('Price'), findsNWidgets(1));
        expect(find.text('Symbol'), findsNWidgets(1));
        expect(find.text('Bitcoin'), findsNWidgets(1));
        expect(find.text('26000.0'), findsNWidgets(1));
      });
    });
  });
}
