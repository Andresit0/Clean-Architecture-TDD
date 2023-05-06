part of domain.entities;

class CriptoCurrencyListState {
  final bool isLoading;
  final List<CriptocurrencyEntity>? listCriptoCurrency;
  final String? httpError;

  const CriptoCurrencyListState({
    this.isLoading = false,
    this.listCriptoCurrency,
    this.httpError,
  });

  CriptoCurrencyListState copyWith(
      {bool? isLoading,
      List<CriptocurrencyEntity>? listCriptoCurrency,
      String? httpError}) {
    return CriptoCurrencyListState(
      isLoading: isLoading ?? this.isLoading,
      listCriptoCurrency: listCriptoCurrency ?? this.listCriptoCurrency,
      httpError: httpError ?? this.httpError,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CriptoCurrencyListState &&
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

  CriptocurrencyEntity({
    required this.name,
    required this.symbol,
    required this.price,
  });

  factory CriptocurrencyEntity.from(Map<String, dynamic> json) {
    return CriptocurrencyEntity(
      name: json['name'],
      symbol: json['symbol'],
      price: json['current_price'],
    );
  }

  CriptocurrencyEntity copyWith({
    String? name,
    String? symbol,
    double? price,
  }) =>
      CriptocurrencyEntity(
        name: name ?? this.name,
        symbol: symbol ?? this.symbol,
        price: price ?? this.price,
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
