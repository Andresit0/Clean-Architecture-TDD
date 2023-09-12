part of presentation.screens;

class CriptocurrenciesView extends StatelessWidget {
  final CriptoCurrencyListStateEntity criptocurrrencies;
  const CriptocurrenciesView({
    super.key,
    required this.criptocurrrencies,
  });
  Widget criptoCurrencyList(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          SizedBox(
              width: double.infinity,
              child: CustomHeader(
                text:
                    localization.AppLocalizations.of(context)!.criptocurrencies,
              )),
          SingleChildScrollView(
            child: Column(
              children: [
                criptocurrrencies.httpError != null
                    ? Text(
                        criptocurrrencies.httpError!.errorMessage,
                        key: const Key('httpError'),
                      )
                    : criptocurrrencies.isLoading
                        ? const CircularProgressIndicator(
                            key: Key('circularProgressIndicator'),
                          )
                        : CustomTable(
                            key: const Key('tableWithCriptocurrencies'),
                            titleColumn: [
                              localization.AppLocalizations.of(context)!.name,
                              localization.AppLocalizations.of(context)!.symbol,
                              localization.AppLocalizations.of(context)!.price,
                            ],
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
      body: criptoCurrencyList(context),
    );
  }
}
