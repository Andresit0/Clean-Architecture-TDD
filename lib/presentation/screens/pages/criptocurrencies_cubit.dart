import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/variables/_variable.lib.dart';
import '../../../domain/entities/_entities.lib.dart';
import '../../../main.dart';
import '../../controllers/criptocurrencies_cubit/cubit/criptocurrencies_cubit_cubit.dart';
import '../_screen.lib.dart';

class CriptocurrenciesCubit extends StatefulWidget {
  static String name = 'criptocurrencies_cubit';
  static const path = '/home/criptocurrencies_cubit';
  static bool reload = true;
  const CriptocurrenciesCubit({Key? key}) : super(key: key);

  @override
  State<CriptocurrenciesCubit> createState() => _CriptocurrenciesCubitState();
}

class _CriptocurrenciesCubitState extends State<CriptocurrenciesCubit> {
  @override
  void initState() {
    updateCriptoCurrencyList();
    super.initState();
  }

  updateCriptoCurrencyList() async {
    MyApp.criptocurrenciesCubit.loadNextCriptocurrencyData(
      currencyIDs: CustomVariables.dynCriptocurrencyList.criptocurrencies,
      context: context,
    );
    while (CriptocurrenciesCubit.reload) {
      await Future.delayed(const Duration(seconds: 30), () {
        MyApp.criptocurrenciesCubit.loadNextCriptocurrencyData(
          currencyIDs: CustomVariables.dynCriptocurrencyList.criptocurrencies,
          context: context,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CriptocurrenciesCubitController,
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
