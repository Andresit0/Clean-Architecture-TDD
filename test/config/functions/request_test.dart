import 'package:clean_architecture/config/functions/_functions.lib.dart';
import 'package:clean_architecture/domain/entities/_entities.lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'request_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<CustomRequestFunc>(as: #MockCustomRequestFunc),
  MockSpec<RestErrorEntity>(as: #MockRestError),
  MockSpec<BuildContext>(as: #MockBuildContext),
])
void main() {
  late MockCustomRequestFunc sut;
  late MockBuildContext context;
  late MockRestError restError;

  setUp(() {
    sut = MockCustomRequestFunc();
    context = MockBuildContext();
    restError = MockRestError();
  });
  group('Evaluation of CustomRequestFunc class', () {
    Map<String, String> successResponse = {'response': 'success'};

    test(
      "Get: success value",
      () async {
        when(sut.get(uri: Uri(), context: context))
            .thenAnswer((realInvocation) => successResponse);
        Map<String, String> getResponse =
            await sut.get(uri: Uri(), context: context);
        verify(sut.get(uri: Uri(), context: context)).called(1);
        expect(getResponse, successResponse);
      },
    );
    test(
      "Get: failure value",
      () async {
        when(sut.get(uri: Uri(), context: context))
            .thenAnswer((realInvocation) => restError);
        MockRestError getResponse = await sut.get(uri: Uri(), context: context);
        verify(sut.get(uri: Uri(), context: context)).called(1);
        expect(getResponse, restError);
      },
    );
  });
}
