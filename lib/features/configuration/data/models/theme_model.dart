import 'package:flutter/material.dart';
import 'package:pomodore/core/constant/constant.dart';
import 'package:pomodore/features/configuration/domain/entities/theme_entity.dart';

class ThemeModel extends ThemeEntity {
  const ThemeModel(super.title, super.theme);

  static ThemeData titleToTheme(String title) {
    late ThemeData theme;
    switch (title) {
      case "light":
        theme = AppConstant.defaultLightTheme;
        break;
      case "dark":
        theme = AppConstant.defaultDarkTheme;
        break;
      default:
        theme = AppConstant.defaultLightTheme;
    }
    return theme;
  }
}
