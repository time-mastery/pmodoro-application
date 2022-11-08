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
  static const secondaryColor = Color(0xffFFDAB9);
  static const primaryColor = Color(0xffFA8072);
  static const scaffoldColor = Color(0xff002366);
  static const funColor = Color(0xffFF1E00);
  static const swatchColor = Color(0xff0F52BA);

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
