import 'package:flutter/material.dart';

class AppTypography {
  static const String _interLight = "InterLight"; // not mal texts
  static const String _interRegular = "InterRegular"; // highlighting texts
  static const String _interMedium = "interMedium"; // titles heading etc

  static String get interLight => _interLight; // normal
  static String get interRegular => _interRegular; // highlights
  static String get interMedium => _interMedium; // title headings

  static TextTheme textTheme = TextTheme(
    // large | medium fonts
    displayLarge: _buildMediumText(),
    headlineLarge: _buildMediumText(),
    titleLarge: _buildMediumText(),
    bodyLarge: _buildMediumText(),
    labelLarge: _buildMediumText(),

    // regular
    displayMedium: _buildRegularText(),
    headlineMedium: _buildRegularText(),
    titleMedium: _buildRegularText(),
    bodyMedium: _buildRegularText(),
    labelMedium: _buildRegularText(),

    // small light fonts
    displaySmall: _buildLightText(),
    headlineSmall: _buildLightText(),
    titleSmall: _buildLightText(),
    bodySmall: _buildLightText(),
    labelSmall: _buildLightText(),
  );

  static TextStyle _buildLightText() {
    return TextStyle(fontFamily: _interLight); // nor male texts
  }

  static TextStyle _buildRegularText() {
    return TextStyle(fontFamily: _interRegular); // highlighting texts
  }

  static TextStyle _buildMediumText() {
    return TextStyle(fontFamily: _interMedium); // title headings
  }
}
