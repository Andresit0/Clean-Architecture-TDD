// Mocks generated by Mockito 5.4.2 from annotations
// in clean_architecture/test/infrastructure/datasources/criptocurrency_datasource_imp_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;

import 'package:clean_architecture/domain/entities/_entities.lib.dart' as _i2;
import 'package:clean_architecture/infrastructure/datasources/_datasources.lib.dart'
    as _i5;
import 'package:flutter/foundation.dart' as _i4;
import 'package:flutter/material.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeCriptoCurrencyListStateEntity_0 extends _i1.SmartFake
    implements _i2.CriptoCurrencyListStateEntity {
  _FakeCriptoCurrencyListStateEntity_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeWidget_1 extends _i1.SmartFake implements _i3.Widget {
  _FakeWidget_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );

  @override
  String toString({_i3.DiagnosticLevel? minLevel = _i3.DiagnosticLevel.info}) =>
      super.toString();
}

class _FakeInheritedWidget_2 extends _i1.SmartFake
    implements _i3.InheritedWidget {
  _FakeInheritedWidget_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );

  @override
  String toString({_i3.DiagnosticLevel? minLevel = _i3.DiagnosticLevel.info}) =>
      super.toString();
}

class _FakeDiagnosticsNode_3 extends _i1.SmartFake
    implements _i3.DiagnosticsNode {
  _FakeDiagnosticsNode_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );

  @override
  String toString({
    _i4.TextTreeConfiguration? parentConfiguration,
    _i3.DiagnosticLevel? minLevel = _i3.DiagnosticLevel.info,
  }) =>
      super.toString();
}

class _FakeBuildContext_4 extends _i1.SmartFake implements _i3.BuildContext {
  _FakeBuildContext_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeObject_5 extends _i1.SmartFake implements Object {
  _FakeObject_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [CriptocurrencyDatasourceImp].
///
/// See the documentation for Mockito's code generation for more information.
class MockCriptocurrencyDatasourceImp extends _i1.Mock
    implements _i5.CriptocurrencyDatasourceImp {
  MockCriptocurrencyDatasourceImp() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i2.CriptoCurrencyListStateEntity> getCriptocurrencies({
    required List<String>? currencyIdsList,
    required _i3.BuildContext? context,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getCriptocurrencies,
          [],
          {
            #currencyIdsList: currencyIdsList,
            #context: context,
          },
        ),
        returnValue: _i6.Future<_i2.CriptoCurrencyListStateEntity>.value(
            _FakeCriptoCurrencyListStateEntity_0(
          this,
          Invocation.method(
            #getCriptocurrencies,
            [],
            {
              #currencyIdsList: currencyIdsList,
              #context: context,
            },
          ),
        )),
      ) as _i6.Future<_i2.CriptoCurrencyListStateEntity>);
}

/// A class which mocks [BuildContext].
///
/// See the documentation for Mockito's code generation for more information.
class MockBuildContext extends _i1.Mock implements _i3.BuildContext {
  MockBuildContext() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Widget get widget => (super.noSuchMethod(
        Invocation.getter(#widget),
        returnValue: _FakeWidget_1(
          this,
          Invocation.getter(#widget),
        ),
      ) as _i3.Widget);
  @override
  bool get mounted => (super.noSuchMethod(
        Invocation.getter(#mounted),
        returnValue: false,
      ) as bool);
  @override
  bool get debugDoingBuild => (super.noSuchMethod(
        Invocation.getter(#debugDoingBuild),
        returnValue: false,
      ) as bool);
  @override
  _i3.InheritedWidget dependOnInheritedElement(
    _i3.InheritedElement? ancestor, {
    Object? aspect,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #dependOnInheritedElement,
          [ancestor],
          {#aspect: aspect},
        ),
        returnValue: _FakeInheritedWidget_2(
          this,
          Invocation.method(
            #dependOnInheritedElement,
            [ancestor],
            {#aspect: aspect},
          ),
        ),
      ) as _i3.InheritedWidget);
  @override
  void visitAncestorElements(_i3.ConditionalElementVisitor? visitor) =>
      super.noSuchMethod(
        Invocation.method(
          #visitAncestorElements,
          [visitor],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void visitChildElements(_i3.ElementVisitor? visitor) => super.noSuchMethod(
        Invocation.method(
          #visitChildElements,
          [visitor],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void dispatchNotification(_i3.Notification? notification) =>
      super.noSuchMethod(
        Invocation.method(
          #dispatchNotification,
          [notification],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i3.DiagnosticsNode describeElement(
    String? name, {
    _i4.DiagnosticsTreeStyle? style = _i4.DiagnosticsTreeStyle.errorProperty,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #describeElement,
          [name],
          {#style: style},
        ),
        returnValue: _FakeDiagnosticsNode_3(
          this,
          Invocation.method(
            #describeElement,
            [name],
            {#style: style},
          ),
        ),
      ) as _i3.DiagnosticsNode);
  @override
  _i3.DiagnosticsNode describeWidget(
    String? name, {
    _i4.DiagnosticsTreeStyle? style = _i4.DiagnosticsTreeStyle.errorProperty,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #describeWidget,
          [name],
          {#style: style},
        ),
        returnValue: _FakeDiagnosticsNode_3(
          this,
          Invocation.method(
            #describeWidget,
            [name],
            {#style: style},
          ),
        ),
      ) as _i3.DiagnosticsNode);
  @override
  List<_i3.DiagnosticsNode> describeMissingAncestor(
          {required Type? expectedAncestorType}) =>
      (super.noSuchMethod(
        Invocation.method(
          #describeMissingAncestor,
          [],
          {#expectedAncestorType: expectedAncestorType},
        ),
        returnValue: <_i3.DiagnosticsNode>[],
      ) as List<_i3.DiagnosticsNode>);
  @override
  _i3.DiagnosticsNode describeOwnershipChain(String? name) =>
      (super.noSuchMethod(
        Invocation.method(
          #describeOwnershipChain,
          [name],
        ),
        returnValue: _FakeDiagnosticsNode_3(
          this,
          Invocation.method(
            #describeOwnershipChain,
            [name],
          ),
        ),
      ) as _i3.DiagnosticsNode);
}

/// A class which mocks [RestErrorEntity].
///
/// See the documentation for Mockito's code generation for more information.
class MockRestErrorEntity extends _i1.Mock implements _i2.RestErrorEntity {
  MockRestErrorEntity() {
    _i1.throwOnMissingStub(this);
  }

  @override
  set responseCode(int? _responseCode) => super.noSuchMethod(
        Invocation.setter(
          #responseCode,
          _responseCode,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i3.BuildContext get context => (super.noSuchMethod(
        Invocation.getter(#context),
        returnValue: _FakeBuildContext_4(
          this,
          Invocation.getter(#context),
        ),
      ) as _i3.BuildContext);
  @override
  String get httpPath => (super.noSuchMethod(
        Invocation.getter(#httpPath),
        returnValue: '',
      ) as String);
  @override
  String get errorMessage => (super.noSuchMethod(
        Invocation.getter(#errorMessage),
        returnValue: '',
      ) as String);
  @override
  String get stackTrace => (super.noSuchMethod(
        Invocation.getter(#stackTrace),
        returnValue: '',
      ) as String);
  @override
  Object get exception => (super.noSuchMethod(
        Invocation.getter(#exception),
        returnValue: _FakeObject_5(
          this,
          Invocation.getter(#exception),
        ),
      ) as Object);
  @override
  String get messageToShow => (super.noSuchMethod(
        Invocation.getter(#messageToShow),
        returnValue: '',
      ) as String);
}
