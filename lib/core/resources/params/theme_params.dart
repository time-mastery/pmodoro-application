import 'package:flutter/material.dart';
import 'package:pomodore/core/constant/constant.dart';

class ThemeParams {
  final String key;
  final ThemeData theme;
  final String title;

  ThemeParams(this.key, this.theme, this.title);

  static ThemeData titleToTheme(String key) {
    late ThemeData theme;
    for (var element in AppConstant.themes) {
      if (element.key == key) theme = element.theme;
    }
    return theme;
  }
}
