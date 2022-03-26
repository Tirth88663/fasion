import 'package:flutter/material.dart';

class MyTheme with ChangeNotifier {
  static bool isLight = true;

  ThemeMode currentTheme() {
    return isLight ? ThemeMode.light : ThemeMode.dark;
  }

  void switchTheme() {
    isLight = !isLight;
    notifyListeners();
  }
}
