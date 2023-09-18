import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/variables/_variable.lib.dart';
import 'presentation/controllers/criptocurrencies_bloc/criptocurrencies_bloc.dart';
import 'presentation/controllers/criptocurrencies_cubit/cubit/criptocurrencies_cubit_cubit.dart';

const scopeProvider = ProviderScope(child: MyApp()); //Riverpod and Riverpod 2.0

void main() {
  setPathUrlStrategy();
  return runApp(scopeProvider);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static CriptoCurrencyLoadingBloc criptoCurrencyLoadingBloc =
      CriptoCurrencyLoadingBloc();
  static CriptocurrenciesCubitController criptocurrenciesCubit =
      CriptocurrenciesCubitController();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Locale>(
      initialData: CustomVariables.dynEnviroment.locale,
      stream: CustomVariables.constLocalization.localeStreamController.stream,
      builder: (context, snapshotLocale) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => MyApp.criptocurrenciesCubit),
            BlocProvider(create: (_) => MyApp.criptoCurrencyLoadingBloc),
          ],
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
  }
}
