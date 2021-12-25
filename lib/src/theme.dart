import 'package:flutter/material.dart';

import 'decorators.dart';

enum ThemoreThemeMode {
  darkStandard,
  lightStandard,
}

class ThemoreTheme extends ChangeNotifier {
  ThemoreTheme({
    ThemoreThemeMode? themeMode,
  }) : _themeMode = themeMode ?? ThemoreThemeMode.darkStandard;

  ThemoreThemeMode _themeMode;

  ThemoreThemeMode get themeMode => _themeMode;

  ThemeData get data {
    switch (themeMode) {
      case ThemoreThemeMode.darkStandard:
        return darkStandard;
      case ThemoreThemeMode.lightStandard:
        return lightStandard;
      default:
        return darkStandard;
    }
  }

  ThemeData get darkStandard {
    return ThemoreStandard(
      child: ThemoreDark(),
    ).data;
  }

  ThemeData get lightStandard {
    return ThemoreStandard(
      child: ThemoreLight(),
    ).data;
  }

  set themeMode(ThemoreThemeMode value) {
    if (value != _themeMode) {
      _themeMode = value;
      notifyListeners();
    }
  }
}
