import 'package:clean_architecture/config/functions/_functions.lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'dialog_test.mocks.dart';

@GenerateMocks([CustomDialogFunc, BuildContext])
void main() {
  late MockCustomDialogFunc sut;
  late MockBuildContext context;
  setUp(() {
    sut = MockCustomDialogFunc();
    context = MockBuildContext();
  });
  group('Review if dialog is open', () {
    test('True response', () {
      when(sut.isActive(context)).thenReturn(true);
      expect(sut.isActive(context), true);
    });
    test('False response', () {
      when(sut.isActive(context)).thenReturn(false);
      expect(sut.isActive(context), false);
    });
  });
}
