import 'package:flutter/material.dart';
import 'package:skility_x/constants/app_colors.dart';

class FilterColorModel {
  final Color boxColor;
  final Color textColor;

  FilterColorModel({
    required this.boxColor,
    required this.textColor,
  });
}

class FilterScreenConfig {
  static int getColorIndex(int input, int maxLength) {
    final int index = input % maxLength;
    return index;
  }

  static List<FilterColorModel> getColorsLists() {
    final List<FilterColorModel> isList = [
      FilterColorModel(
          boxColor: AppColors.primary, textColor: AppColors.secondary),
      FilterColorModel(
          boxColor: AppColors.error, textColor: AppColors.onBackground),
      FilterColorModel(
          boxColor: AppColors.selectedItemIcon,
          textColor: AppColors.onBackground),
      FilterColorModel(
          boxColor: AppColors.unselectedItemIcon, textColor: AppColors.error),
      FilterColorModel(
          boxColor: AppColors.onBackground, textColor: AppColors.error),
    ];

    return isList;
  }
}
