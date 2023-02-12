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
  static const defaultLightColors = {
    "lightTextColor": Color(0xffC3AED6),
    "darkTextColor": Color(0xff333456),
    "primaryColor": Color(0xffF4ABC4),
    "secondaryColor": Color(0xffA084CA),
    "scaffoldBgColor": Color(0xff333456),
    "funColor": Color(0xffC3AED6),
    "swatchColor": Color(0xffD3DBFF),
  };
  static const defaultDarkColors = {
    "lightTextColor": Color(0xffC3AED6),
    "darkTextColor": Color(0xff333456),
    "primaryColor": Color(0xffF4ABC4),
    "secondaryColor": Color(0xffA084CA),
    "scaffoldBgColor": Color(0xff333456),
    "funColor": Color(0xffC3AED6),
    "swatchColor": Color(0xffD3DBFF),
  };

  // app theme
  static lightDefaultTheme() => ThemeData(
        primaryColor: defaultLightColors["primaryColor"],
        scaffoldBackgroundColor: defaultLightColors["scaffoldBgColor"],
        fontFamily: fontFamily,
        brightness: Brightness.light,
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: false,
          iconTheme: IconThemeData(
            color: defaultLightColors["primaryColor"],
          ),
        ),
        cardColor: defaultLightColors["primaryColor"],
        hintColor: defaultLightColors["primaryColor"],
        iconTheme: IconThemeData(
          color: defaultLightColors["primaryColor"],
        ),
        buttonTheme: const ButtonThemeData(
          textTheme: ButtonTextTheme.normal,
        ),
      );

  static darkDefaultTheme() => ThemeData(
        primaryColor: defaultLightColors["primaryColor"],
        scaffoldBackgroundColor: defaultLightColors["scaffoldBgColor"],
        fontFamily: fontFamily,
        brightness: Brightness.light,
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: false,
          iconTheme: IconThemeData(
            color: defaultLightColors["primaryColor"],
          ),
        ),
        cardColor: defaultLightColors["primaryColor"],
        hintColor: defaultLightColors["primaryColor"],
        iconTheme: IconThemeData(
          color: defaultLightColors["primaryColor"],
        ),
        buttonTheme: const ButtonThemeData(
          textTheme: ButtonTextTheme.normal,
        ),
      );
}
