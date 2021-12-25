import 'package:flutter/material.dart';

import 'theme.dart';

class ThemoreScope extends InheritedNotifier {
  const ThemoreScope({
    Key? key,
    required ThemoreTheme theme,
    required Widget child,
  }) : super(key: key, notifier: theme, child: child);
}

class Themore extends StatefulWidget {
  const Themore({
    Key? key,
    this.themeMode,
    required this.child,
  }) : super(key: key);

  final ThemoreThemeMode? themeMode;
  final Widget child;

  static ThemoreTheme of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemoreScope>()!.notifier
        as ThemoreTheme;
  }

  @override
  _ThemoreState createState() => _ThemoreState();
}

class _ThemoreState extends State<Themore> {
  late final ThemoreTheme _theme;

  @override
  void initState() {
    super.initState();
    _theme = ThemoreTheme(
      themeMode: widget.themeMode,
    );
  }

  @override
  void dispose() {
    _theme.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ThemoreScope(
      theme: _theme,
      child: widget.child,
    );
  }
}
