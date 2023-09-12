import 'package:clean_architecture/presentation/screens/_screen.lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../testing/_testing.lib.dart';

void main() {
  late CustomTable sut;

  setUp(() {
    sut = const CustomTable(
      titleColumn: ['column_1', 'column_2', 'column_3'],
      bodyColumn: [
        ['body_1'],
        ['body_2'],
        ['body_3'],
      ],
    );
  });

  Widget testingWidget(Widget widget) {
    Widget tesWidget = mockMyApp(
      home: Builder(
        builder: (BuildContext context) {
          return widget;
        },
      ),
    );
    return MaterialApp(
      home: tesWidget,
    );
  }

  testWidgets(
    "Reviewing table",
    (WidgetTester tester) async {
      await tester.pumpWidget(testingWidget(sut));
      expect(find.byWidget(sut), findsOneWidget);
      expect(find.bySemanticsLabel('column_3'), findsOneWidget);
      expect(find.bySemanticsLabel('body_3'), findsOneWidget);
    },
  );
}
