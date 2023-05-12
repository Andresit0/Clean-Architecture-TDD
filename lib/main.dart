import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'config/variables/_variable.lib.dart';

void main() {
  setPathUrlStrategy();
  return runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Locale>(
      initialData: CustomVariables.dynEnviroment.locale,
      stream: CustomVariables.constLocalization.localeStreamController.stream,
      builder: (context, snapshotLocale) {
        return MaterialApp.router(
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
        );
      },
    );
  }
}
