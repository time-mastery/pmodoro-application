import 'package:flutter/material.dart';

class AppConstant {
  /// dimens
  static const radius = 10;

  // strings
  static const appName = "Pomodore";

  // Hero tags
  static const splashIconHeroTag = "__splash-appbar__";

  // colors
  static const whiteColor = Color(0xffF2F2F2);
  static const cyanColor = Color(0xff5CB8E4);
  static const purpleColor = Color(0xff8758FF);
  static const blackColor = Color(0xff181818);
  static const limeColor = Color(0xffF0FF42);
  static const pinkColor = Color(0xffFF74B1);

  // app theme
  static getTheme(BuildContext context) => ThemeData(
        primaryColor: purpleColor,
        scaffoldBackgroundColor: blackColor,
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: false,
          iconTheme: IconThemeData(
            color: cyanColor,
          ),
        ),
        iconTheme: const IconThemeData(
          color: cyanColor,
        ),
        buttonTheme: const ButtonThemeData(
          textTheme: ButtonTextTheme.normal,
        ),
        textTheme: Theme.of(context)
            .textTheme
            .copyWith(button: const TextStyle(color: whiteColor))
            .apply(
              bodyColor: whiteColor,
              displayColor: whiteColor,
            ),
      );
}
