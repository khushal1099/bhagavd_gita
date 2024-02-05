import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class ThemeProvider extends ChangeNotifier {
  bool isTheme = false;

  ThemeMode? get thememode {
    if(isTheme == false) {
      return ThemeMode.light;
    } else if(isTheme == true) {
      return ThemeMode.dark;
    } else {
      return null;
    }
  }

  void setTheme(bool theme) {
    prefs.setBool('theme', theme);
    isTheme = theme;
    notifyListeners();
  }

  void getTheme() {
    isTheme = prefs.getBool('theme') ?? false;
    notifyListeners();
  }
}