import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class ThemoreDecorator {
  ThemeData get data;
}

class ThemoreStandard extends ThemoreDecorator {
  ThemoreStandard({required this.child});

  final ThemoreDecorator child;

  @override
  ThemeData get data {
    return child.data.copyWith(
      inputDecorationTheme: child.data.inputDecorationTheme.copyWith(
        filled: true,
      ),
      primaryTextTheme: GoogleFonts.sawarabiGothicTextTheme(
        child.data.primaryTextTheme,
      ),
      textTheme: GoogleFonts.sawarabiGothicTextTheme(child.data.textTheme),
    );
  }
}

class ThemoreDark extends ThemoreDecorator {
  @override
  ThemeData get data => ThemeData.dark();
}

class ThemoreLight extends ThemoreDecorator {
  @override
  ThemeData get data => ThemeData.light();
}
