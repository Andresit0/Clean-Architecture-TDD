part of 'criptocurrencies_bloc.dart';

@immutable
abstract class CriptoCurrencyLoadingEvent {}

class LoadNextCriptocurrencyData extends CriptoCurrencyLoadingEvent {
  final List<String>? currencyIDs;
  final BuildContext context;
  LoadNextCriptocurrencyData({this.currencyIDs, required this.context});
}

class CriptocurrenciesLoading extends CriptoCurrencyLoadingEvent {
  final CriptoCurrencyListStateEntity criptoCurrencyListStateEntity;
  CriptocurrenciesLoading({required this.criptoCurrencyListStateEntity});
}
