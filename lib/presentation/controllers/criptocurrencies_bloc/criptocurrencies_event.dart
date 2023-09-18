part of 'criptocurrencies_bloc.dart';

@immutable
abstract class CriptoCurrencyLoadingEvent {}

class LoadNextCriptocurrencyData extends CriptoCurrencyLoadingEvent {
  final List<String>? currencyIDs;
  final BuildContext context;
  final CriptocurrencyRepositoryImp? criptocurrencyRepositoryImp;
  LoadNextCriptocurrencyData(
      {this.currencyIDs,
      required this.context,
      this.criptocurrencyRepositoryImp});
}

class CriptocurrenciesLoading extends CriptoCurrencyLoadingEvent {
  final CriptoCurrencyListStateEntity criptoCurrencyListStateEntity;
  CriptocurrenciesLoading({required this.criptoCurrencyListStateEntity});
}
