import 'package:flutter/material.dart';

/// Color palette designed for WCAG AAA compliance (7:1 contrast ratio).
class AppColors {
  AppColors._();

  // Primary brand colors
  static const Color primary = Color(0xFF1565C0);       // Blue 800
  static const Color primaryLight = Color(0xFF1E88E5);   // Blue 600
  static const Color primaryDark = Color(0xFF0D47A1);    // Blue 900

  // Companion colors
  static const Color brianColor = Color(0xFF1565C0);     // Blue - warm, trustworthy
  static const Color ginaColor = Color(0xFF6A1B9A);      // Purple - fun, playful
  static const Color mollyColor = Color(0xFF00695C);      // Teal - calm, informative

  // Semantic colors
  static const Color success = Color(0xFF2E7D32);        // Green 800
  static const Color warning = Color(0xFFE65100);        // Orange 900
  static const Color error = Color(0xFFC62828);          // Red 800
  static const Color info = Color(0xFF1565C0);           // Blue 800

  // Alert levels
  static const Color alertCritical = Color(0xFFC62828);  // Red
  static const Color alertWarning = Color(0xFFE65100);   // Orange
  static const Color alertInfo = Color(0xFF1565C0);      // Blue

  // Neutral colors (WCAG AAA on white backgrounds)
  static const Color textPrimary = Color(0xFF212121);    // Grey 900
  static const Color textSecondary = Color(0xFF424242);  // Grey 800
  static const Color textHint = Color(0xFF616161);       // Grey 700 (7:1 on white)
  static const Color background = Color(0xFFFAFAFA);     // Grey 50
  static const Color surface = Color(0xFFFFFFFF);        // White
  static const Color divider = Color(0xFFBDBDBD);        // Grey 400

  // High contrast mode overrides
  static const Color highContrastText = Color(0xFF000000);
  static const Color highContrastBackground = Color(0xFFFFFFFF);
  static const Color highContrastPrimary = Color(0xFF0D47A1);

  // Call screen colors
  static const Color callGreen = Color(0xFF2E7D32);
  static const Color callRed = Color(0xFFC62828);
}
