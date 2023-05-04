part of config.variables;

class CustomConstThemeApp {
  ThemeData getTheme() =>
      ThemeData(useMaterial3: true, colorSchemeSeed: const Color(0xFF2862F5));
}
