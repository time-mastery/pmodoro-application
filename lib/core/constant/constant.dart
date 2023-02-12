import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppConstant {
  /// dimens
  static const radius = 10;

  // strings
  static const appName = "Pomodore";
  static const fontFamily = "inter";

  // Hero tags
  static const splashIconHeroTag = "__splash-appbar__";

  // path
  static String getLogoPath(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? "assets/images/logov2_light_mode.png"
          : "assets/images/logov2.png";

  static TextStyle getTextStyle({double? fontSize, Color? color}) =>
      GoogleFonts.archivo(
        fontSize: fontSize,
        color: color,
      );

  static TextTheme getTextTheme({Color? color}) => TextTheme(
        bodyLarge: getTextStyle(color: color),
        bodyMedium: getTextStyle(color: color),
        bodySmall: getTextStyle(color: color),
        displayLarge: getTextStyle(color: color),
        displayMedium: getTextStyle(color: color),
        displaySmall: getTextStyle(color: color),
        headlineLarge: getTextStyle(color: color),
        headlineMedium: getTextStyle(color: color),
        headlineSmall: getTextStyle(color: color),
        labelLarge: getTextStyle(color: color),
        labelMedium: getTextStyle(color: color),
        labelSmall: getTextStyle(color: color),
        titleLarge: getTextStyle(color: color),
        titleMedium: getTextStyle(color: color),
        titleSmall: getTextStyle(color: color),
      );

  static final defaultLightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    cardColor: Colors.white,
    cardTheme: const CardTheme(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    ),
    textTheme: getTextTheme(color: Colors.black),
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: Colors.black,
      onPrimary: Colors.white,
      secondary: const Color(0xff01ED64),
      onSecondary: Colors.black,
      error: Colors.red,
      onError: Colors.white,
      background: Colors.white,
      onBackground: Colors.black,
      surface: Colors.black.withOpacity(.001),
      onSurface: Colors.white,
    ),
    buttonTheme: const ButtonThemeData(),
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: Colors.black,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      elevation: 10,
    ),
    switchTheme: SwitchThemeData(),
    inputDecorationTheme:
        InputDecorationTheme(enabledBorder: UnderlineInputBorder()),
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
  );
  static final defaultDarkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    cardColor: Colors.white.withOpacity(.1),
    cardTheme: const CardTheme(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    ),
    textTheme: getTextTheme(color: Colors.white),
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: const Color(0xff01ED64),
      onPrimary: Colors.black,
      secondary: const Color(0xff01ED64),
      onSecondary: Colors.black,
      error: Colors.red,
      onError: Colors.white,
      background: Colors.black,
      onBackground: Colors.white,
      surface: Colors.white.withOpacity(.001),
      onSurface: Colors.white,
    ),
    buttonTheme: const ButtonThemeData(),
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: Color(0xff01ED64),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.black,
      elevation: 10,
    ),
    switchTheme: SwitchThemeData(),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.white,
        ),
      ),
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
  );
}
