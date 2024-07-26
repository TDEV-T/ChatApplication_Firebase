import "package:chat_app/themes/dark_mode.dart";
import "package:chat_app/themes/light_mode.dart";
import "package:flutter/material.dart";

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == darkMode;

  set themeDataSet(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == lightMode) {
      themeDataSet = darkMode;
    } else {
      themeDataSet = lightMode;
    }
  }
}