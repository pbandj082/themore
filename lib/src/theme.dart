import 'package:flutter/material.dart';

import 'decorators.dart';

class ThemoreThemeScope extends InheritedNotifier {
  const ThemoreThemeScope({
    Key? key,
    required ThemoreTheme theme,
    required Widget child,
  }) : super(key: key, notifier: theme, child: child);

  static ThemoreTheme of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ThemoreThemeScope>()!
        .notifier as ThemoreTheme;
  }
}

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
