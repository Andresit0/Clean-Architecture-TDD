part of presentation.testing;

Widget mockMyAppBloc({required providers}) {
  Widget tesWidget = StreamBuilder<Locale>(
    initialData: CustomVariables.dynEnviroment.locale,
    stream: CustomVariables.constLocalization.localeStreamController.stream,
    builder: (context, snapshotLocale) {
      return MultiBlocProvider(
        providers: providers,
        child: MaterialApp.router(
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''),
            Locale('es', ''),
          ],
          locale: snapshotLocale.data,
          routerConfig: CustomVariables.constRoute.appRouter,
          debugShowCheckedModeBanner: false,
          theme: CustomVariables.constThemeApp.getTheme(),
        ),
      );
    },
  );
  return tesWidget;
}
