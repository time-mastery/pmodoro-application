import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:google_fonts/google_fonts.dart";
import "package:pomodore/core/resources/params/theme_params.dart";

class AppConstant {
  static final _poppinsFont = GoogleFonts.poppins().fontFamily;

  /// dimens
  static const radius = 10.0;
  static const modalPadding = 15.0;
  static const iconSize = 20.0;

  // strings
  static const appName = "Pomodoro";
  static const fontFamily = "inter";

  // Hero tags
  static const splashIconHeroTag = "__splash-appbar__";

  // path
  static String getLogoPath(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? "assets/images/logov2_light_mode.png"
          : "assets/images/logov2.png";

  static String? getFontFamily() => _poppinsFont;

  static TextStyle getTextStyle({
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
  }) =>
      TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
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

  static ThemeData _baseTheme({
    required Color scaffoldColor,
    required Color cardColor,
    required ColorScheme colorScheme,
    required TextTheme textTheme,
    required Color snackBarColor,
    required Color iconColor,
    required SystemUiOverlayStyle systemOverlay,
    required Color bottomNavColor,
    required Color? borderColor,
  }) {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: scaffoldColor,
      fontFamily: getFontFamily(),
      cardColor: cardColor,
      cardTheme: const CardTheme(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      textTheme: textTheme,
      colorScheme: colorScheme,
      snackBarTheme: SnackBarThemeData(
        backgroundColor: snackBarColor,
      ),
      appBarTheme: AppBarTheme(
        systemOverlayStyle: systemOverlay,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: iconColor,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: bottomNavColor,
        elevation: 10,
      ),
      switchTheme: const SwitchThemeData(),
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: borderColor ?? iconColor,
          ),
        ),
      ),
      iconTheme: IconThemeData(
        color: iconColor,
      ),
    );
  }

  static final defaultLightTheme = _baseTheme(
    scaffoldColor: Colors.white,
    cardColor: Colors.white,
    colorScheme: const ColorScheme.light(
      primary: Colors.black,
      onPrimary: Colors.white,
      secondary: Color(0xff01ED64),
      onSecondary: Colors.black,
      error: Colors.red,
      onError: Colors.white,
      surface: Colors.black12,
      onSurface: Colors.black,
      surfaceTint: Colors.black12,
      surfaceContainerHighest: Colors.black12,
      inverseSurface: Colors.white,
    ),
    textTheme: getTextTheme(color: Colors.black),
    snackBarColor: Colors.black,
    iconColor: Colors.black,
    systemOverlay: SystemUiOverlayStyle.light,
    bottomNavColor: Colors.white,
    borderColor: null,
  );

  static final defaultDarkTheme = _baseTheme(
    scaffoldColor: Colors.black,
    cardColor: Colors.white10,
    colorScheme: const ColorScheme.dark(
      primary: Color(0xff01ED64),
      onPrimary: Colors.black,
      secondary: Color(0xff01ED64),
      onSecondary: Colors.black,
      error: Colors.red,
      onError: Colors.white,
      surface: Colors.white10,
      onSurface: Colors.white,
      surfaceTint: Colors.white10,
      surfaceContainerHighest: Colors.white24,
      inverseSurface: Colors.black,
    ),
    textTheme: getTextTheme(color: Colors.white),
    snackBarColor: const Color(0xff01ED64),
    iconColor: Colors.white,
    systemOverlay: SystemUiOverlayStyle.dark,
    bottomNavColor: Colors.black,
    borderColor: Colors.white,
  );

  static final polarNightTheme = _baseTheme(
    scaffoldColor: const Color(0xff2e3440),
    cardColor: Colors.white10,
    colorScheme: const ColorScheme.dark(
      primary: Color(0xffd8dee9),
      onPrimary: Colors.black,
      secondary: Color(0xff8fbcbb),
      onSecondary: Colors.black,
      error: Colors.red,
      onError: Colors.white,
      surface: Colors.white10,
      onSurface: Colors.white,
      surfaceTint: Colors.white10,
      surfaceContainerHighest: Colors.white24,
      inverseSurface: Color(0xff2e3440),
    ),
    textTheme: getTextTheme(color: Colors.white),
    snackBarColor: const Color(0xff8fbcbb),
    iconColor: Colors.white,
    systemOverlay: SystemUiOverlayStyle.light,
    bottomNavColor: const Color(0xff434c5e),
    borderColor: Colors.white,
  );

  static final darkBlueTheme = _baseTheme(
    scaffoldColor: const Color(0xff0C134F),
    cardColor: const Color(0xff1D267D),
    colorScheme: const ColorScheme.dark(
      primary: Color(0xffD4ADFC),
      onPrimary: Colors.black,
      secondary: Color(0xffD864A9),
      onSecondary: Colors.black,
      error: Colors.red,
      onError: Colors.white,
      surface: Colors.white10,
      onSurface: Colors.white,
      surfaceTint: Colors.white10,
      surfaceContainerHighest: Colors.white24,
      inverseSurface: Color(0xff0C134F),
    ),
    textTheme: getTextTheme(color: Colors.white),
    snackBarColor: const Color(0xffD4ADFC),
    iconColor: Colors.white,
    systemOverlay: SystemUiOverlayStyle.light,
    bottomNavColor: const Color(0xff654E92),
    borderColor: Colors.white,
  );

  static List<ThemeParams> themes = [
    ThemeParams("light", defaultLightTheme, "Light Minimal"),
    ThemeParams("dark", defaultDarkTheme, "Dark Minimal"),
    ThemeParams("polar", polarNightTheme, "Polar Night"),
    ThemeParams("darkblue", darkBlueTheme, "Dark Blue"),
  ];
}
