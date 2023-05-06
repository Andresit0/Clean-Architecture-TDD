part of domain.repositories;

abstract class CriptocurrencyRepository {
  Future<CriptoCurrencyListState> getCriptocurrency(
      List<String> currencyIdsList);
}
