import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Accessible theme with configurable font sizing (18pt-32pt).
class AppTheme {
  AppTheme._();

  static ThemeData light({double fontSize = 20.0}) {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        onPrimary: Colors.white,
        secondary: AppColors.primaryLight,
        onSecondary: Colors.white,
        error: AppColors.error,
        onError: Colors.white,
        surface: AppColors.surface,
        onSurface: AppColors.textPrimary,
      ),
      scaffoldBackgroundColor: AppColors.background,
      textTheme: _buildTextTheme(fontSize),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(48, 48),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          textStyle: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w600),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(48, 48),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          textStyle: TextStyle(fontSize: fontSize),
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          minimumSize: const Size(48, 48),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        labelStyle: TextStyle(fontSize: fontSize),
        hintStyle: TextStyle(fontSize: fontSize, color: AppColors.textHint),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.surface,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
        titleTextStyle: TextStyle(
          fontSize: fontSize + 2,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
      ),
      cardTheme: CardThemeData(
        elevation: 2,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }

  static ThemeData highContrast({double fontSize = 20.0}) {
    return light(fontSize: fontSize).copyWith(
      colorScheme: const ColorScheme.light(
        primary: AppColors.highContrastPrimary,
        onPrimary: Colors.white,
        surface: AppColors.highContrastBackground,
        onSurface: AppColors.highContrastText,
      ),
      scaffoldBackgroundColor: AppColors.highContrastBackground,
    );
  }

  static TextTheme _buildTextTheme(double baseSize) {
    return TextTheme(
      displayLarge: TextStyle(fontSize: baseSize + 12, fontWeight: FontWeight.w700, color: AppColors.textPrimary),
      displayMedium: TextStyle(fontSize: baseSize + 8, fontWeight: FontWeight.w600, color: AppColors.textPrimary),
      displaySmall: TextStyle(fontSize: baseSize + 4, fontWeight: FontWeight.w600, color: AppColors.textPrimary),
      headlineLarge: TextStyle(fontSize: baseSize + 6, fontWeight: FontWeight.w600, color: AppColors.textPrimary),
      headlineMedium: TextStyle(fontSize: baseSize + 4, fontWeight: FontWeight.w600, color: AppColors.textPrimary),
      headlineSmall: TextStyle(fontSize: baseSize + 2, fontWeight: FontWeight.w600, color: AppColors.textPrimary),
      titleLarge: TextStyle(fontSize: baseSize + 2, fontWeight: FontWeight.w600, color: AppColors.textPrimary),
      titleMedium: TextStyle(fontSize: baseSize, fontWeight: FontWeight.w500, color: AppColors.textPrimary),
      titleSmall: TextStyle(fontSize: baseSize - 2, fontWeight: FontWeight.w500, color: AppColors.textPrimary),
      bodyLarge: TextStyle(fontSize: baseSize, fontWeight: FontWeight.w400, color: AppColors.textPrimary),
      bodyMedium: TextStyle(fontSize: baseSize - 2, fontWeight: FontWeight.w400, color: AppColors.textPrimary),
      bodySmall: TextStyle(fontSize: baseSize - 4, fontWeight: FontWeight.w400, color: AppColors.textSecondary),
      labelLarge: TextStyle(fontSize: baseSize, fontWeight: FontWeight.w600, color: AppColors.textPrimary),
      labelMedium: TextStyle(fontSize: baseSize - 2, fontWeight: FontWeight.w500, color: AppColors.textPrimary),
      labelSmall: TextStyle(fontSize: baseSize - 4, fontWeight: FontWeight.w500, color: AppColors.textSecondary),
    );
  }
}
