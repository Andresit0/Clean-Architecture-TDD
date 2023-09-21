import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../config/variables/_variable.lib.dart';
import '../../../domain/entities/_entities.lib.dart';
import '../../controllers/criptocurrencies_provider/criptocurrencies_provider.dart';
import '../_screen.lib.dart';

class CriptocurrenciesProviderPage extends StatefulWidget {
  static String name = 'criptocurrencies_provider';
  static const path = '/home/criptocurrencies_provider';
  static bool reload = false;
  static CriptoCurrencyListStateEntity? mockResponse;
  const CriptocurrenciesProviderPage({Key? key}) : super(key: key);

  @override
  State<CriptocurrenciesProviderPage> createState() =>
      _CriptocurrenciesProviderPageState();
}

class _CriptocurrenciesProviderPageState
    extends State<CriptocurrenciesProviderPage> {
  @override
  void initState() {
    updateCriptoCurrencyList();
    super.initState();
  }

  updateCriptoCurrencyList() async {
    await Future.delayed(const Duration(seconds: 1), () {
      context
          .read<CriptocurrenciesProviderController>()
          .loadNextCriptocurrencyData(
              context: context,
              mockResponse: CriptocurrenciesProviderPage.mockResponse);
    });
    while (CriptocurrenciesProviderPage.reload) {
      await Future.delayed(const Duration(seconds: 30), () {
        context
            .watch<CriptocurrenciesProviderController>()
            .loadNextCriptocurrencyData(
                currencyIDs:
                    CustomVariables.dynCriptocurrencyList.criptocurrencies,
                context: context,
                mockResponse: CriptocurrenciesProviderPage.mockResponse);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomVariables.constColors.appBackground,
        body: Consumer<CriptocurrenciesProviderController>(
          builder: (context, params, child) {
            return CriptocurrenciesView(
                criptocurrrencies: params.criptoCurrencyListStateEntity);
          },
        ));
  }
}
