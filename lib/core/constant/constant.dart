import 'package:flutter/material.dart';

class AppConstant {
  /// dimens
  static const radius = 10;

  // strings
  static const appName = "Pomodore";

  // Hero tags
  static const splashIconHeroTag = "__splash-appbar__";

  // colors
  static const textColor = Color(0xffF7F7F7);
  static const secondaryColor = Color(0xffF2E7D5);
  static const primaryColor = Color(0xff6D9886);
  static const scaffoldColor = Color(0xff393E46);
  static const funColor = Color(0xffFF1E00);
  static const swatchColor = Color(0xff59CE8F);

  // app theme
  static getTheme(BuildContext context) => ThemeData(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: scaffoldColor,
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: false,
          iconTheme: IconThemeData(
            color: secondaryColor,
          ),
        ),
        iconTheme: const IconThemeData(
          color: secondaryColor,
        ),
        buttonTheme: const ButtonThemeData(
          textTheme: ButtonTextTheme.normal,
        ),
        textTheme: Theme.of(context)
            .textTheme
            .copyWith(button: const TextStyle(color: textColor))
            .apply(
              bodyColor: textColor,
              displayColor: textColor,
            ),
      );
}
