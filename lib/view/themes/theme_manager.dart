import 'package:flutter/material.dart';
import 'package:skility_x/view/themes/dark_theme.dart';

class ThemeManager {
  static DarkTheme _darkTheme = DarkTheme();

  static ThemeData get darkTheme => _darkTheme.theme;
}
