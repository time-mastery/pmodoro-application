import 'package:flutter/material.dart';

class AppConstant {
  /// strings
  static const appName = "Pomodore";

  /// colors
  static const blackColor = Color(0xff082032);
  static const orangeColor = Color(0xffFF4C29);
  static const pinkColor = Color(0xffFB2576);
  static const greyColor = Color.fromARGB(1, 41, 41, 43);

  static const primaryColor = orangeColor;
  static const appbarColor = Colors.transparent;
  static const scaffoldBackgroundColor = greyColor;
  static const appbarIconColor = greyColor;
  static const iconColor = orangeColor;
  static const textThemeColor = Colors.white;
  static const buttonTextThemeColor = orangeColor;

  /// app theme
  static getTheme(BuildContext context) => ThemeData(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: appbarColor,
          centerTitle: false,
          iconTheme: IconThemeData(
            color: appbarIconColor,
          ),
        ),
        iconTheme: const IconThemeData(
          color: iconColor,
        ),
        buttonTheme: const ButtonThemeData(
          textTheme: ButtonTextTheme.normal,
        ),
        textTheme: Theme.of(context)
            .textTheme
            .copyWith(button: const TextStyle(color: buttonTextThemeColor))
            .apply(
              bodyColor: textThemeColor,
              displayColor: textThemeColor,
            ),
      );
}
