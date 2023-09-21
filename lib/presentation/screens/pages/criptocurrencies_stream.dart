import 'package:clean_architecture/presentation/controllers/criptocurrencies_stream/criptocurrencies_stream.dart';
import 'package:flutter/material.dart';

import '../../../config/variables/_variable.lib.dart';
import '../../../domain/entities/_entities.lib.dart';
import '../_screen.lib.dart';

class CriptocurrenciesStreamPage extends StatefulWidget {
  static String name = 'criptocurrencies_stream';
  static const path = '/home/criptocurrencies_stream';
  static bool reload = true;
  static CriptoCurrencyListStateEntity? mockResponse;
  const CriptocurrenciesStreamPage({Key? key}) : super(key: key);

  @override
  State<CriptocurrenciesStreamPage> createState() =>
      _CriptocurrenciesStreamPageState();
}

class _CriptocurrenciesStreamPageState
    extends State<CriptocurrenciesStreamPage> {
  @override
  void initState() {
    super.initState();
    updateCriptoCurrencyList(context);
  }

  updateCriptoCurrencyList(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2), () async {
      await CriptocurrenciesStreamController.loadNextCriptocurrencyData(
        context: context,
        mockResponse: CriptocurrenciesStreamPage.mockResponse,
      );
    });
    while (CriptocurrenciesStreamPage.reload) {
      await Future.delayed(const Duration(seconds: 30)).then((value) async {
        await CriptocurrenciesStreamController.loadNextCriptocurrencyData(
          currencyIDs: CustomVariables.dynCriptocurrencyList.criptocurrencies,
          context: context,
          mockResponse: CriptocurrenciesStreamPage.mockResponse,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<CriptoCurrencyListStateEntity>(
      initialData: const CriptoCurrencyListStateEntity(isLoading: true),
      stream:
          CriptocurrenciesStreamController.criptoCurrencyListStateEntity.stream,
      builder: ((context, snapshot) {
        return CriptocurrenciesView(criptocurrrencies: snapshot.data!);
      }),
    );
  }
}
