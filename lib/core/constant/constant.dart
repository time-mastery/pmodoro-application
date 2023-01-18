import 'package:flutter/material.dart';

class AppConstant {
  /// dimens
  static const radius = 10;

  // strings
  static const appName = "Pomodore";
  static const fontFamily = "inter";

  // Hero tags
  static const splashIconHeroTag = "__splash-appbar__";

  // colors
  static const textColor = Color(0xffC3AED6);
  static const secondaryColor = Color(0xffA084CA);
  static const primaryColor = Color(0xffF4ABC4);
  static const scaffoldColor = Color(0xff333456);
  static const funColor = Color(0xffC3AED6);
  static const swatchColor = Color(0xffD3DBFF);

  // app theme
  static getTheme(BuildContext context) => ThemeData(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: scaffoldColor,
        fontFamily: fontFamily,
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: false,
          iconTheme: IconThemeData(
            color: secondaryColor,
          ),
        ),
        hintColor: secondaryColor,
        iconTheme: const IconThemeData(
          color: secondaryColor,
        ),
        buttonTheme: const ButtonThemeData(
          textTheme: ButtonTextTheme.normal,
        ),
        textTheme:
            Theme.of(context).textTheme.copyWith(button: const TextStyle(color: textColor)).apply(
                  bodyColor: textColor,
                  displayColor: textColor,
                ),
      );
}
