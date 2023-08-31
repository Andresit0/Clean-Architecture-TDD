import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/entities/_entities.lib.dart';

part 'criptocurrencies_loading_riverpod2.0.g.dart';

@riverpod
class CriptocurrenciesLoadingRiverpod2
    extends _$CriptocurrenciesLoadingRiverpod2 {
  @override
  CriptoCurrencyListStateEntity build() {
    return const CriptoCurrencyListStateEntity(isLoading: true);
  }

  void newCriptoCurrencyListStateEntity(
      CriptoCurrencyListStateEntity newCriptoCurrencyListStateEntity) {
    state = newCriptoCurrencyListStateEntity;
  }
}
