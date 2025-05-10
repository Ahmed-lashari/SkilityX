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
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.surface,
        iconTheme: IconThemeData(color: AppColors.onBackground),
        titleTextStyle: TextStyle(color: AppColors.onBackground, fontSize: 20),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.bottomNavBackground,
        selectedIconTheme: IconThemeData(color: AppColors.selectedItemIcon),
        selectedItemColor: AppColors.selectedItemText,
        unselectedIconTheme: IconThemeData(color: AppColors.unselectedItemIcon),
        unselectedItemColor: AppColors.unselectedItemIcon,
        showUnselectedLabels: false,
        selectedLabelStyle: TextStyle(color: AppColors.selectedItemText),
        type: BottomNavigationBarType.fixed,
      ),
      cardTheme: CardTheme(
        color: AppColors.surface,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      // : AppColors.error,
    );
  }
}
