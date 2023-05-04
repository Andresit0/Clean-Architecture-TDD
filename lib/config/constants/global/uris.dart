class UriList {
  static const String https = 'https';
  static const String coingecko = 'api.coingecko.com';
  static final Uri coingeckoMarkets =
      Uri(scheme: https, host: coingecko, path: 'api/v3/coins/markets');
}
