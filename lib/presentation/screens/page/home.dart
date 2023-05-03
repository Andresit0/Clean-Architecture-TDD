import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../config/constants/global/colors.dart';
import '../../../domain/entities/criptocurrency_entity.dart';
import '../../../config/dynamic/criptocurrencies/list.dart';
import '../../providers/criptocurrencies/criptocurrencies.dart';
import '../widgets/label.dart';
import '../widgets/table.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(getCriptocurrenciesProvider.notifier).loadNextCriptocurrencyData();
  }

  Widget criptoCurrencyList(List<CriptocurrencyEntity> criptoCurrrencies) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          SizedBox(
              width: double.infinity,
              child: header(
                text: 'CRYPTOCURRENCY',
              )),
          SingleChildScrollView(
            child: Column(
              children: [
                criptoCurrrencies.isEmpty
                    ? const CircularProgressIndicator()
                    : table(
                        titleColumn: ['NAME', 'SYMBOL', 'PRICE'],
                        bodyColumn: [
                          for (var criptocurrency in criptoCurrrencies)
                            [
                              criptocurrency.name,
                              criptocurrency.symbol,
                              criptocurrency.price.toString()
                            ],
                        ],
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void updateCriptoCurrencyList(BuildContext context) async {
    while (true) {
      await Future.delayed(const Duration(seconds: 30)).then((value) => ref
          .read(getCriptocurrenciesProvider.notifier)
          .loadNextCriptocurrencyData(currencyIDs: criptocurrencies));
    }
  }

  @override
  Widget build(BuildContext context) {
    updateCriptoCurrencyList(context);
    final criptoCurrrencies = ref.watch(getCriptocurrenciesProvider);
    return Scaffold(
      backgroundColor: CustomColor.appBackground,
      body: criptoCurrencyList(criptoCurrrencies),
    );
  }
}
