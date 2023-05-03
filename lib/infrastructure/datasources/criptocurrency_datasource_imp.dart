import 'dart:convert';

import 'package:clean_architecture/domain/datasources/criptocurrency_datasource.dart';
import 'package:clean_architecture/domain/entities/criptocurrency_entity.dart';
import 'package:clean_architecture/infrastructure/mappers/criptocurrency_mapper.dart';
import 'package:clean_architecture/infrastructure/models/criptocurrency_coingecko_model.dart';
import 'package:http/http.dart';

class CriptocurrencyDatasourceImp extends CriptocurrencyDatasource {
  @override
  Future<List<CriptocurrencyEntity>> getCriptocurrencies(
      List<String> currencyIdsList) async {
    var uri = Uri(
      scheme: 'https',
      host: 'api.coingecko.com',
      path: 'api/v3/coins/markets',
      queryParameters: {
        'vs_currency': 'usd',
        'ids': currencyIdsList.join(','),
      },
    );
    var response = await get(uri);
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      return result
          .map((json) => CriptocurrencyMapper.criptocurrencyToEntity(
              CriptocurrencyCoingeckoModel.fromJson(json)))
          .toList();
    } else {
      throw Exception(
          'ERROR: getCritocurrency lib/repository/repositories.dart ${response.body}');
    }
  }
}



 // var response = await get(uri);
    // if (response.statusCode == 200) {
    //   final List result = jsonDecode(response.body);
    //   return result
    //       .map((json) => CriptocurrencyMapper.criptocurrencyToEntity(
    //           CriptocurrencyCoingeckoModel.fromJson(json)))
    //       .toList();
    // } else {
    //   throw Exception(
    //       'ERROR: getCritocurrency lib/repository/repositories.dart ${response.body}');
    // }