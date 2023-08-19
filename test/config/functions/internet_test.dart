import 'package:clean_architecture/config/functions/_functions.lib.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'internet_test.mocks.dart';

@GenerateNiceMocks([MockSpec<CustomInternetFunc>(as: #MockCustomInternetFunc)])
void main() {
  late MockCustomInternetFunc sut;
  setUp(() {
    sut = MockCustomInternetFunc();
  });
  group("Testing user internet connection", () {
    test('CustomInternetFunc was called 1 time', () async {
      when(sut.isActive()).thenAnswer((_) => Future.value(true));
      await sut.isActive();
      verify(sut.isActive()).called(1);
    });
    test('Value obtained is true (user has connection)', () async {
      when(sut.isActive()).thenAnswer((_) => Future.value(true));
      bool response = await sut.isActive();
      expect(response, true);
    });
    test('Value obtained is false (user is offline)', () async {
      when(sut.isActive()).thenAnswer((_) => Future.value(false));
      bool response = await sut.isActive();
      expect(response, false);
    });
  });
}
