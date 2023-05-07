part of domain.repositories;

abstract class CriptocurrencyRepository {
  Future<CriptoCurrencyListState> getCriptocurrency({
    required List<String> currencyIdsList,
    required BuildContext context,
  });
}
