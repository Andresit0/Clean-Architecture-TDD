part of domain.entities;

class CriptoCurrencyListStateEntity {
  final bool isLoading;
  final List<CriptocurrencyEntity>? listCriptoCurrency;
  final RestErrorEntity? httpError;

  const CriptoCurrencyListStateEntity({
    this.isLoading = false,
    this.listCriptoCurrency,
    this.httpError,
  });

  CriptoCurrencyListStateEntity copyWith(
      {bool? isLoading,
      List<CriptocurrencyEntity>? listCriptoCurrency,
      RestErrorEntity? httpError}) {
    return CriptoCurrencyListStateEntity(
      isLoading: isLoading ?? this.isLoading,
      listCriptoCurrency: listCriptoCurrency ?? this.listCriptoCurrency,
      httpError: httpError ?? this.httpError,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CriptoCurrencyListStateEntity &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          listCriptoCurrency == other.listCriptoCurrency &&
          httpError == other.httpError;

  @override
  int get hashCode =>
      isLoading.hashCode ^ listCriptoCurrency.hashCode ^ httpError.hashCode;
}

class CriptocurrencyEntity {
  final String name;
  final String symbol;
  final double price;
  final RestErrorEntity? restError;

  CriptocurrencyEntity({
    required this.name,
    required this.symbol,
    required this.price,
    required this.restError,
  });

  factory CriptocurrencyEntity.from(
      Map<String, dynamic> json, RestErrorEntity? restError) {
    return CriptocurrencyEntity(
      name: json['name'],
      symbol: json['symbol'],
      price: json['current_price'],
      restError: restError,
    );
  }

  CriptocurrencyEntity copyWith({
    String? name,
    String? symbol,
    double? price,
    RestErrorEntity? restError,
  }) =>
      CriptocurrencyEntity(
        name: name ?? this.name,
        symbol: symbol ?? this.symbol,
        price: price ?? this.price,
        restError: restError,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CriptocurrencyEntity &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          symbol == other.symbol &&
          price == other.price;

  @override
  int get hashCode => name.hashCode ^ symbol.hashCode ^ price.hashCode;

  @override
  String toString() => 'name: $name, symbol: $symbol, price: $price';
}
