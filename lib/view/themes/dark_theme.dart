import 'package:flutter/material.dart';
import 'package:skility_x/constants/app_colors.dart';
import 'package:skility_x/view/themes/theme_conts/typography.dart';

class DarkTheme {
  ThemeData get theme => _getDarkThemeData();

  ThemeData _getDarkThemeData() {
    final base = ThemeData.dark(useMaterial3: true);

    return base.copyWith(
        colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: AppColors.primary,
          onPrimary: AppColors.onPrimary,
          secondary: AppColors.secondary,
          onSecondary: AppColors.onSecondary,
          background: AppColors.background,
          onBackground: AppColors.onBackground,
          surface: AppColors.surface,
          onSurface: AppColors.onBackground,
          error: AppColors.error,
          onError: AppColors.onPrimary,
        ),
        textTheme: AppTypography.textTheme,
        scaffoldBackgroundColor: AppColors.background,
        appBarTheme: _buildAppBarTheme(),
        bottomNavigationBarTheme: _buildBottomNavBarTheme(),
        cardTheme: _buildCardTheme(),
        inputDecorationTheme: _buildInputDecorationTheme()

        // : AppColors.error,
        );
  }

  AppBarTheme _buildAppBarTheme() {
    return AppBarTheme(
      backgroundColor: AppColors.surface,
      iconTheme: IconThemeData(color: AppColors.onBackground),
      titleTextStyle: TextStyle(color: AppColors.onBackground, fontSize: 20),
    );
  }

  BottomNavigationBarThemeData _buildBottomNavBarTheme() {
    return BottomNavigationBarThemeData(
      backgroundColor: AppColors.bottomNavBackground,
      selectedIconTheme: IconThemeData(color: AppColors.selectedItemIcon),
      selectedItemColor: AppColors.selectedItemText,
      unselectedIconTheme: IconThemeData(color: AppColors.unselectedItemIcon),
      unselectedItemColor: AppColors.unselectedItemIcon,
      showUnselectedLabels: false,
      selectedLabelStyle: TextStyle(color: AppColors.selectedItemText),
      type: BottomNavigationBarType.fixed,
    );
  }

  CardTheme _buildCardTheme() {
    return CardTheme(
      color: AppColors.surface,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    );
  }

  InputDecorationTheme _buildInputDecorationTheme() {
    return InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      prefixIconColor: AppColors.secondary,
      prefixStyle: TextStyle(color: AppColors.secondary),
      hintStyle: TextStyle(
          color: AppColors.onSecondary, fontFamily: AppTypography.scotishBold),
      hintFadeDuration: const Duration(seconds: 1),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: AppColors.bottomNavBackground, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: AppColors.unselectedItemIcon, width: 1),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: AppColors.error, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: AppColors.error, width: 1),
      ),
      errorStyle: TextStyle(
          color: AppColors.error,
          fontSize: 12,
          fontFamily: AppTypography.scotishBold),
      errorMaxLines: 2,
      filled: true,
      fillColor: AppColors.unselectedItemIcon,
    );
  }
}
