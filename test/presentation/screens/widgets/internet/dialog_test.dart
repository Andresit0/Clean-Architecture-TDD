import 'package:clean_architecture/presentation/screens/_screen.lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart' as localization;

import '../../../../testing/_testing.lib.dart';

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

  testWidgets(
    "No internet dialog is shown",
    (WidgetTester tester) async {
      WidgetsFlutterBinding.ensureInitialized();
      await tester.pumpWidget(testingWidget());
      CustomInternetDialog.showNoInternetDialog = true;
      await CustomInternetDialog.customDialogShowedWhenNoInternet(mockContext);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      expect(find.byKey(const Key('alertDialog')), findsOneWidget);
      expect(
          find.bySemanticsLabel(
              localization.AppLocalizations.of(mockContext)!.noInternet),
          findsOneWidget);
    },
  );
}
