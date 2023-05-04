import 'dart:convert';

import 'package:clean_architecture/domain/datasources/criptocurrency_datasource.dart';
import 'package:clean_architecture/domain/entities/criptocurrency_entity.dart';
import 'package:clean_architecture/infrastructure/mappers/criptocurrency_mapper.dart';
import 'package:clean_architecture/infrastructure/models/criptocurrency_coingecko_model.dart';
import 'package:http/http.dart';

import '../../config/constants/global/uris.dart';
import '../../config/functions/functions.lib.dart';

class CriptocurrencyDatasourceImp extends CriptocurrencyDatasource {
  @override
  Future<CriptoCurrencyListState> getCriptocurrencies(
      List<String> currencyIdsList) async {
    Uri uri = UriList.coingeckoMarkets.replace(
      queryParameters: {
        'vs_currency': 'usd',
        'ids': currencyIdsList.join(','),
      },
    );
    var result = await CustomFunctions.request.get(uri: uri);
    return CriptoCurrencyListState(
      listCriptoCurrency: result
          .map<CriptocurrencyEntity>((json) =>
              CriptocurrencyMapper.criptocurrencyToEntity(
                  CriptocurrencyCoingeckoModel.fromJson(json)))
          .toList(),
    );
  }
}
