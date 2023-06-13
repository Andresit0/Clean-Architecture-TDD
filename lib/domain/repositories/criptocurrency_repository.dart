part of domain.repositories;

abstract class CriptocurrencyRepository {
  Future<CriptoCurrencyListStateEntity> getCriptocurrency({
    required List<String> currencyIdsList,
    required BuildContext context,
  });
}
