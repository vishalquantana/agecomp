/// Application-wide constants.
class AppConstants {
  AppConstants._();

  // App info
  static const String appName = 'AgeComp';
  static const String appVersion = '0.1.0';

  // Accessibility
  static const double minFontSize = 18.0;
  static const double maxFontSize = 32.0;
  static const double defaultFontSize = 20.0;
  static const double minTouchTarget = 48.0;

  // API
  static const Duration apiTimeout = Duration(seconds: 30);
  static const Duration voiceCallTimeout = Duration(seconds: 10);

  // Memory
  static const int maxChatHistoryDisplay = 100;
  static const int memoryExtractionDelay = 5; // seconds after conversation ends

  // Navigation
  static const int maxTapsToCompanion = 2;
}
