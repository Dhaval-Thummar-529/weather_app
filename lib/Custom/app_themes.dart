import 'package:flutter/material.dart';

class ThemeHelper {
  final num isDay;

  ThemeHelper({required this.isDay});

  T themeSelector<T>(T dark, T bright) => isDay == 1 ? bright : dark;

  /*Color get cardColor =>
      themeSelector<Color>(AppColors.blockColor, AppColors.card);*/
  Color get textColor => themeSelector<Color>(Colors.white, Colors.black);
/*static Color get greyColor =>
      themeSelector<Color>(AppColors.grey, AppColors.darkGrey);
  static Color get primaryColor =>
      themeSelector<Color>(AppColors.primaryLight, AppColors.primary);
  static Color get appTileColor =>
      themeSelector<Color>(Colors.white, ThemeHelper.greyColor);*/
}
