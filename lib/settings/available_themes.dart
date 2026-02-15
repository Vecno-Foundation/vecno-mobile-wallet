import 'package:flutter/material.dart';

import '../l10n/l10n.dart';
import '../themes/themes.dart';
import 'setting_item.dart';

enum ThemeOptions { VECNOWALLET_DARK, VECNOWALLET_LIGHT, VECNOWALLET_AMOLED_DARK }

class ThemeSetting extends SettingSelectionItem {
  final ThemeOptions theme;

  const ThemeSetting(this.theme);

  String getDisplayName(BuildContext context) {
    final l10n = l10nOf(context);

    switch (theme) {
      case ThemeOptions.VECNOWALLET_LIGHT:
        return l10n.themeLight;
      case ThemeOptions.VECNOWALLET_DARK: 
        return l10n.themeDark;
      case ThemeOptions.VECNOWALLET_AMOLED_DARK:
        return l10n.themeAmoledDark;
    }
  }

  BaseTheme getTheme() {
    switch (theme) {
      case ThemeOptions.VECNOWALLET_LIGHT:
        return VecnoLightTheme();
      case ThemeOptions.VECNOWALLET_DARK:
        return VecnoDarkTheme();
      case ThemeOptions.VECNOWALLET_AMOLED_DARK:
        return VecnoAmoledDarkTheme();
    }
  }

  // For saving to shared prefs
  String getId() => theme.name;
}
