import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_strategy/url_strategy.dart';

import 'config/variables/variable.lib.dart';

void main() {
  setPathUrlStrategy();
  return runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: CustomVariables.constRoute.appRouter,
      debugShowCheckedModeBanner: false,
      theme: CustomConstThemeApp().getTheme(),
    );
  }
}
