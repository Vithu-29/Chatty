import 'package:flutter/material.dart';
import 'package:flutter_chat_project/themes/dark_mode.dart';
import 'package:flutter_chat_project/themes/light_mode.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  // 1. Initialize with light mode by default
  ThemeData _themeData = lightMode;

  // Key for storing the value in SharedPreferences
  static const String _themeStatusKey = "THEME_STATUS";

  // Constructor: Load the theme immediately when the app starts
  ThemeProvider() {
    _loadThemeFromPrefs();
  }

  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == darkMode;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() async {
    if (_themeData == lightMode) {
      _themeData = darkMode;
    } else {
      _themeData = lightMode;
    }
    // 2. Save the new preference whenever we toggle
    await _saveThemeToPrefs();
    notifyListeners();
  }

  // --- Helper Methods for SharedPreferences ---

  Future<void> _loadThemeFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    // Try to get the boolean. If it's null (first time run), default to false (light mode).
    final isDark = prefs.getBool(_themeStatusKey) ?? false;

    if (isDark) {
      _themeData = darkMode;
    } else {
      _themeData = lightMode;
    }
    notifyListeners();
  }

  Future<void> _saveThemeToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    // Save true if current theme is dark, false otherwise
    await prefs.setBool(_themeStatusKey, isDarkMode);
  }
}
