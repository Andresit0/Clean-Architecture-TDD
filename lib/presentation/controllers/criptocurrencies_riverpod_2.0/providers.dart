import 'package:clean_architecture/presentation/controllers/criptocurrencies_riverpod_2.0/criptocurrencies_loading_riverpod2.0.dart';
import 'package:clean_architecture/presentation/controllers/criptocurrencies_riverpod_2.0/criptocurrencies_riverpod2.0.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final criptocurrenciesLoadingRiverpod2P =
    Provider<CriptocurrenciesLoadingRiverpod2>((ref) {
  final auth = CriptocurrenciesLoadingRiverpod2();
  return auth;
});

final criptocurrenciesRiverpod2Provider =
    Provider<CriptocurrenciesRiverpod2>((ref) {
  final auth = CriptocurrenciesRiverpod2();
  return auth;
});
