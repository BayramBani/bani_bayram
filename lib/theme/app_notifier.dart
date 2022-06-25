import 'package:flutter/material.dart';
import 'app_theme.dart';
import 'dart:developer' as dev;

class AppNotifier extends ChangeNotifier {
  updateTheme(ThemeType themeType) {
    dev.log('AppNotifier.updateTheme($themeType)');
    _changeTheme(themeType);
    notifyListeners();

    //updateInStorage(themeType);
  }

  void _changeTheme(ThemeType themeType) {
    dev.log('AppNotifier._changeTheme($themeType)');
    AppTheme.themeType = themeType;
    AppTheme.theme = AppTheme.getTheme(themeType: themeType);
  }
}
