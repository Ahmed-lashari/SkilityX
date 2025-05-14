import 'package:flutter/material.dart';

class AppTypography {
  static const String _scotishBold = "ScotishBold";
  static const String _scotishMedium = "ScotishMedium";
  static const String _scotishRegular = "ScotishRegular";

  static String get scotishBold => _scotishBold;
  static String get scotishMedium => _scotishMedium;
  static String get scotishRegular => _scotishRegular;

  static TextTheme textTheme = TextTheme(
    // large | medium fonts
    displayLarge: _buildBoldText(),
    headlineLarge: _buildBoldText(),
    titleLarge: _buildBoldText(),
    bodyLarge: _buildBoldText(),
    labelLarge: _buildBoldText(),

    // regular
    displayMedium: _buildMediumText(),
    headlineMedium: _buildMediumText(),
    titleMedium: _buildMediumText(),
    bodyMedium: _buildMediumText(),
    labelMedium: _buildMediumText(),

    // small
    displaySmall: _buildRegularText(),
    headlineSmall: _buildRegularText(),
    titleSmall: _buildRegularText(),
    bodySmall: _buildRegularText(),
    labelSmall: _buildRegularText(),
  );

  static TextStyle _buildBoldText() {
    return TextStyle(fontFamily: _scotishBold);
  }

  static TextStyle _buildMediumText() {
    return TextStyle(fontFamily: _scotishMedium);
  }

  static TextStyle _buildRegularText() {
    return TextStyle(fontFamily: _scotishRegular);
  }
}
