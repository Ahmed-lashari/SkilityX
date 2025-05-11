import 'package:flutter/material.dart';

class AppTypography {
  static const String _interMedium = "interMedium";
  static String get interMedium => _interMedium;

  static TextTheme textTheme = TextTheme(
    // large | medium fonts
    displayLarge: _buildMediumText(),
    headlineLarge: _buildMediumText(),
    titleLarge: _buildMediumText(),
    bodyLarge: _buildMediumText(),
    labelLarge: _buildMediumText(),

    // regular
    displayMedium: _buildMediumText(),
    headlineMedium: _buildMediumText(),
    titleMedium: _buildMediumText(),
    bodyMedium: _buildMediumText(),
    labelMedium: _buildMediumText(),
    displaySmall: _buildMediumText(),
    headlineSmall: _buildMediumText(),
    titleSmall: _buildMediumText(),
    bodySmall: _buildMediumText(),
    labelSmall: _buildMediumText(),
  );

  static TextStyle _buildMediumText() {
    return TextStyle(fontFamily: _interMedium);
  }
}
