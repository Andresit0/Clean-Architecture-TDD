part of presentation.screens;

class HomePage extends StatelessWidget {
  static const name = 'home';
  static const path = '/home';
  final StreamController<bool> switchStreamController =
      StreamController.broadcast();
  HomePage({super.key});
  Widget criptoCurrencyList() {
    return Column(
      children: [
        TextButton(
          onPressed: () => CustomVariables.constRoute.appRouter
              .push(CriptocurrenciesRiverpodPageCtrl.path),
          child: const Text('Riverpod'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomVariables.constColors.black,
        title: Text(
          localization.AppLocalizations.of(context)!.criptocurrencies,
          style: CustomVariables.constLetterStyle.title,
        ),
        actions: [
          StreamBuilder<bool>(
              initialData:
                  CustomVariables.dynEnviroment.locale == const Locale('es'),
              stream: switchStreamController.stream,
              builder: (context, snapshot) {
                return Switch(
                  value: snapshot.data!,
                  onChanged: (value) {
                    if (CustomVariables.dynEnviroment.locale ==
                        const Locale('es')) {
                      CustomVariables.constLocalization.localeStreamController
                          .add(CustomVariables.dynEnviroment.locale =
                              const Locale('en'));
                      switchStreamController.add(false);
                    } else {
                      CustomVariables.constLocalization.localeStreamController
                          .add(CustomVariables.dynEnviroment.locale =
                              const Locale('es'));
                      switchStreamController.add(true);
                    }
                  },
                );
              })
        ],
      ),
      backgroundColor: CustomVariables.constColors.appBackground,
      body: criptoCurrencyList(),
    );
  }
}
