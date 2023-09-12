import 'package:clean_architecture/presentation/screens/_screen.lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../testing/_testing.lib.dart';

void main() {
  late BuildContext mockContext;
  setUp(() {});

  Widget testingWidget() {
    Widget tesWidget = mockMyApp(
      home: Builder(
        builder: (BuildContext context) {
          mockContext = context;
          return Container();
        },
      ),
    );
    return MaterialApp(
      home: tesWidget,
    );
  }

  testWidgets("Show dialog", (WidgetTester tester) async {
    await tester.pumpWidget(testingWidget());
    CustomDialog.customDialogHeaderBodyFooter(
        context: mockContext,
        colorHeaderBackground: Colors.white,
        title: const Text(
          'Dialog Title',
          key: Key('dialogText'),
        ),
        colorClose: Colors.black,
        body: const Column(),
        footerButtons: [],
        dialogHeight: 200,
        dialogWidth: 100,
        onclose: () {});
    await tester.pumpAndSettle(const Duration(seconds: 1));
    expect(find.text('Dialog Title'), findsOneWidget);
    expect(find.byKey(const Key('dialogText')), findsOneWidget);
  });
}
