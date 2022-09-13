import 'package:flutter/material.dart';

import '../app_theme.dart';

class SwitchState {
  final bool isDarkThemeOn;
  ThemeData? theme;
  SwitchState({required this.isDarkThemeOn}) {
    if (isDarkThemeOn) {
      theme = appThemeData[AppTheme.darkAppTheme];
    } else {
      theme = appThemeData[AppTheme.lightAppTheme];
    }
  }

  SwitchState copyWith({required bool changeState}) {
    return SwitchState(isDarkThemeOn: changeState);
  }
}
