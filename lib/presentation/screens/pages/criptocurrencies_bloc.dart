import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/variables/_variable.lib.dart';
import '../../../domain/entities/_entities.lib.dart';
import '../../../main.dart';
import '../../controllers/criptocurrencies_bloc/criptocurrencies_bloc.dart';
import '../_screen.lib.dart';

class CriptocurrenciesBloc extends StatefulWidget {
  static String name = 'criptocurrencies_bloc';
  static const path = '/home/criptocurrencies_bloc';
  static bool reload = true;
  const CriptocurrenciesBloc({Key? key}) : super(key: key);

  @override
  State<CriptocurrenciesBloc> createState() => _CriptocurrenciesBlocState();
}

class _CriptocurrenciesBlocState extends State<CriptocurrenciesBloc> {
  @override
  void initState() {
    updateCriptoCurrencyList();
    super.initState();
  }

  updateCriptoCurrencyList() async {
    while (CriptocurrenciesBloc.reload) {
      await Future.delayed(const Duration(seconds: 30), () {
        MyApp.criptoCurrencyLoadingBloc.loadNextCriptocurrencyData(
          currencyIDs: CustomVariables.dynCriptocurrencyList.criptocurrencies,
          context: context,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CriptoCurrencyLoadingBloc,
        CriptoCurrencyListStateEntity>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: CustomVariables.constColors.appBackground,
          body: CriptocurrenciesView(criptocurrrencies: state),
        );
      },
    );
  }
}
