part of config.variables;

class CustomConstUri {
  static String https = 'https';
  static String coingecko = 'api.coingecko.com';
  Uri coingeckoMarkets =
      Uri(scheme: https, host: coingecko, path: 'api/v3/coins/markets');
}
