part of presentation.screens;

class CriptocurrenciesView extends StatelessWidget {
  final CriptoCurrencyListState criptocurrrencies;
  const CriptocurrenciesView({
    super.key,
    required this.criptocurrrencies,
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomVariables.constColors.appBackground,
        leading: const BackButton(color: Colors.white),
      ),
      backgroundColor: CustomVariables.constColors.appBackground,
      body: criptoCurrencyList(),
    );
  }
}
