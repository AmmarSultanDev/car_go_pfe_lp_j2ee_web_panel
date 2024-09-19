import 'package:car_go_pfe_lp_j2ee_web_panel/app_colors.dart';
import 'package:flutter/material.dart';

class WebAppTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.lightPrimary,
    scaffoldBackgroundColor: AppColors.lightSurface,
    colorScheme: const ColorScheme.light(
      primary: AppColors.lightPrimary,
      onPrimary: AppColors.lightOnPrimary,
      secondary: AppColors.lightSecondary,
      onSecondary: AppColors.lightOnSecondary,
      surface: AppColors.lightSurface,
    ),
    fontFamily: 'Montserrat',
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 72.0,
        fontWeight: FontWeight.bold,
        color: AppColors.lightOnPrimary,
      ),
      headlineMedium: TextStyle(
        fontSize: 36.0,
        fontStyle: FontStyle.italic,
        color: AppColors.lightPrimary,
      ),
      headlineSmall: TextStyle(
        fontSize: 14.0,
        fontFamily: 'Roboto',
        color: AppColors.lightSecondary,
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.lightPrimary,
      iconTheme: IconThemeData(color: AppColors.lightOnPrimary),
      titleTextStyle: TextStyle(
        color: AppColors.lightOnPrimary,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.lightPrimaryVariant,
      textTheme: ButtonTextTheme.primary,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.darkPrimary,
    canvasColor: AppColors.darkBackground,
    scaffoldBackgroundColor: AppColors.darkSurface,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.darkPrimary,
      onPrimary: AppColors.darkOnPrimary,
      secondary: AppColors.darkSecondary,
      onSecondary: AppColors.darkOnSecondary,
      surface: AppColors.darkSurface,
    ),
    fontFamily: 'Montserrat',
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 72.0,
        fontWeight: FontWeight.bold,
        color: AppColors.darkOnPrimary,
      ),
      headlineMedium: TextStyle(
        fontSize: 36.0,
        fontStyle: FontStyle.italic,
        color: AppColors.darkPrimary,
      ),
      headlineSmall: TextStyle(
        fontSize: 14.0,
        fontFamily: 'Roboto',
        color: AppColors.darkSecondary,
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.darkPrimary,
      iconTheme: IconThemeData(color: AppColors.darkOnPrimary),
      titleTextStyle: TextStyle(
        color: AppColors.darkOnPrimary,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.darkPrimaryVariant,
      textTheme: ButtonTextTheme.primary,
    ),
  );
}
