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

  static TextStyle getTextStyle({double? fontSize}) => GoogleFonts.archivo();

  static final defaultLightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    cardColor: Colors.white,
    cardTheme: const CardTheme(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    ),
    textTheme: TextTheme(
      bodyLarge: getTextStyle(),
      bodyMedium: getTextStyle(),
      bodySmall: getTextStyle(),
      displayLarge: getTextStyle(),
      displayMedium: getTextStyle(),
      displaySmall: getTextStyle(),
      headlineLarge: getTextStyle(),
      headlineMedium: getTextStyle(),
      headlineSmall: getTextStyle(),
      labelLarge: getTextStyle(),
      labelMedium: getTextStyle(),
      labelSmall: getTextStyle(),
      titleLarge: getTextStyle(),
      titleMedium: getTextStyle(),
      titleSmall: getTextStyle(),
    ),
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
    switchTheme: SwitchThemeData(

    ),
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
  );
}
