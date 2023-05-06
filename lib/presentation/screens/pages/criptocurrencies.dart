part of presentation.screens;

class CriptocurrenciesScreen extends StatelessWidget {
  final CriptoCurrencyListState criptocurrrencies;
  final Function updateCriptoCurrencyList;
  static const name = 'criptocurrencies-screen';
  const CriptocurrenciesScreen({
    super.key,
    required this.criptocurrrencies,
    required this.updateCriptoCurrencyList,
  });
  Widget criptoCurrencyList() {
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
                criptocurrrencies.httpError != null
                    ? Text(criptocurrrencies.httpError!)
                    : criptocurrrencies.isLoading
                        ? const CircularProgressIndicator()
                        : table(
                            titleColumn: ['NAME', 'SYMBOL', 'PRICE'],
                            bodyColumn: [
                              for (var criptocurrency
                                  in criptocurrrencies.listCriptoCurrency!)
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

  @override
  Widget build(BuildContext context) {
    updateCriptoCurrencyList(context);
    return Scaffold(
      backgroundColor: CustomVariables.constColors.appBackground,
      body: criptoCurrencyList(),
    );
  }
}
