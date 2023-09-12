import 'package:clean_architecture/config/variables/_variable.lib.dart';
import 'package:clean_architecture/presentation/screens/_screen.lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../testing/_testing.lib.dart';

void main() {
  late CustomHeader customHeader;
  late CustomLabelPrincipal customLabelPrincipal;
  late CustomLabelSecundary customLabelSecundary;

  setUp(() {
    customHeader = CustomHeader(text: 'Text CustomHeader');
    customLabelPrincipal =
        const CustomLabelPrincipal(text: 'Text CustomLabelPrincipal');
    customLabelSecundary =
        const CustomLabelSecundary(text: 'Text CustomLabelSecundary');
  });

  Widget testingWidget(Widget widget) {
    Widget tesWidget = mockMyApp(
      home: Builder(
        builder: (BuildContext context) {
          return Row(
            children: [widget],
          );
        },
      ),
    );
    return MaterialApp(
      home: tesWidget,
    );
  }

  group('Verifying text styles', () {
    testWidgets(
      "Verifying CustomHeader",
      (WidgetTester tester) async {
        await tester.pumpWidget(testingWidget(customHeader));
        expect(customHeader.text == 'Text CustomHeader', true);
        expect(
            customHeader.style == CustomVariables.constLetterStyle.title, true);
        expect(customHeader.color == CustomVariables.constColors.black, true);
        expect(customHeader.maxLines == 1, true);
        expect(customHeader.alignment == Alignment.center, true);
      },
    );

    testWidgets(
      "Verifying CustomLabelPrincipal",
      (WidgetTester tester) async {
        await tester.pumpWidget(testingWidget(customLabelPrincipal));
        expect(customLabelPrincipal.text == 'Text CustomLabelPrincipal', true);
      },
    );
    testWidgets(
      "Verifying CustomLabelSecundary",
      (WidgetTester tester) async {
        await tester.pumpWidget(testingWidget(customLabelSecundary));
        expect(customLabelSecundary.text == 'Text CustomLabelSecundary', true);
      },
    );
  });
}
