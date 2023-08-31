import 'package:clean_architecture/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Home Evaluation', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('Criptocurrencies'), findsNWidgets(1));
    expect(find.text('Riverpod'), findsNWidgets(1));
  });
}
