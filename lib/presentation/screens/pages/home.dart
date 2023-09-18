part of presentation.screens;

class HomePage extends StatefulWidget {
  static const name = 'home';
  static const path = '/home';
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final StreamSubscription internetSubscription;
  final StreamController<bool> switchStreamController =
      StreamController.broadcast();

  Widget criptoCurrencyList() {
    return Column(
      children: [
        TextButton(
          onPressed: () => CustomVariables.constRoute.appRouter
              .push(CriptocurrenciesRiverpodPageCtrl.path),
          child: const Text('Riverpod'),
        ),
        TextButton(
          onPressed: () => CustomVariables.constRoute.appRouter
              .push(CriptocurrenciesRiverpod2PageCtrl.path),
          child: const Text('Riverpod 2.0'),
        ),
        TextButton(
          onPressed: () => CustomVariables.constRoute.appRouter
              .push(CriptocurrenciesBloc.path),
          child: const Text('Bloc'),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    internetSubscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) async {
      await CustomInternetDialog.customDialogShowedWhenNoInternet(context);
    });
  }

  @override
  dispose() {
    super.dispose();
    internetSubscription.cancel();
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
