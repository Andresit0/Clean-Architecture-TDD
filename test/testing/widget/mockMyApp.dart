part of presentation.testing;

Widget mockMyApp({required Widget home}) {
  Widget tesWidget = MaterialApp(
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
    locale: const Locale('es', ''),
    debugShowCheckedModeBanner: false,
    theme: CustomVariables.constThemeApp.getTheme(),
    home: home,
  );
  return MaterialApp(
    home: tesWidget,
  );
}
