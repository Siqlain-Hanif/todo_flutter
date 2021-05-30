// @dart=2.11

import 'dart:io';

import 'package:flutter/material.dart';

class AppTheme {
  static final Color accentColor = primaryColorSwatch.shade300;
  static final Color primaryTextColor = primaryColorSwatch.shade500;
  static final Color invertTextColor = Colors.white70;

  static final Color primaryActionColor = primaryColorSwatch.shade500;

  /// Apps background color, Mainly use for Scaffold.backgroundColor
  static const Color backgroundColor = Color(0xfffafafa);
  static const Color unactionedColor = Color(0xff3498db);

  // For use by MaterialApp
  static ThemeData getThemeData() {
    // TODO how to use ThemeData.localize
    final ThemeData original = ThemeData.light().copyWith(
      typography: Typography.material2018(
          platform:
              Platform.isIOS ? TargetPlatform.iOS : TargetPlatform.android),
    );
    // Would use copyWith but it doesn't support primarySwatch
    return ThemeData(
      // Swithcing this to dark gives a dark app bar
      brightness: Brightness.light,
      cursorColor: primaryTextColor,
      accentColorBrightness: Brightness.light,
      scaffoldBackgroundColor: backgroundColor,
      // scaffoldBackgroundColor: Colors.white,
      cardColor: Colors.white,
      primarySwatch: primaryColorSwatch,
      // primaryColor: primaryColor,
      accentColor: accentColor,

      appBarTheme: AppBarTheme(
        brightness: Brightness.light,
        color: Colors.white,
        centerTitle: true,
        elevation: 2,
        textTheme: original.textTheme
            .copyWith(
              headline6: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            )
            .apply(
              bodyColor: Colors.black,
              displayColor: Colors.black,
            ),
        iconTheme: const IconThemeData(
          color: AppTheme.appleGray4,
        ),
      ),

      // Didn't seem to do much
      // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,

      textTheme: original.textTheme
          .copyWith(
            // Currently used for Meetup/Event title and discovery cards
            headline2: original.textTheme.headline2.copyWith(
              fontSize: 24.0,
              fontWeight: FontWeight.w300,
              color: Colors.black,
              // letterSpacing: -0.5,
            ),
            // I use this for card headers such as on meetup details
            headline4: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              color: Colors.black,
              letterSpacing: 0.25,
            ),
            // Used in signup headers
            headline5: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w300,
              letterSpacing: 0,
            ),
            headline6: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.15,
            ),
            // Used for text input for some reason
            subtitle1: original.textTheme.subtitle1.copyWith(
              fontSize: 16.0,
              fontWeight: FontWeight.w300,
            ),
            subtitle2:
                const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
            bodyText1: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
              letterSpacing: .4,
            ),
            bodyText2: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.normal,
              letterSpacing: .25,
            ),
            button: const TextStyle(fontSize: 14),
            // bodyText2?
          )
          .apply(
              // bodyColor: Colors.black,
              // displayColor: Colors.black,
              ),
      inputDecorationTheme: original.inputDecorationTheme.copyWith(
          border: const OutlineInputBorder(borderSide: BorderSide()),
          disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white)),
          hintStyle: const TextStyle(fontWeight: FontWeight.w400),
          errorStyle: const TextStyle(
            fontSize: 13,
            color: Color(0xffcc0000),
            letterSpacing: -0.2,
          )
          // Note careful: using fill messes up the Stream chat
          // filled: true,
          // fillColor: Colors.white,
          ),
      buttonBarTheme: const ButtonBarThemeData(
        buttonPadding: EdgeInsets.symmetric(horizontal: 15),
        layoutBehavior: ButtonBarLayoutBehavior.constrained,
      ),
      iconTheme: const IconThemeData(
        // color: Colors.black,
        color: AppTheme.appleGray4,
        size: 22, //16
      ),
      snackBarTheme: original.snackBarTheme.copyWith(
        actionTextColor: const Color(0xFFe1e1e1),
      ),
      dividerTheme: DividerThemeData(
        color: Colors.grey.shade300,
        thickness: 1,
      ),
      // TODO figure out how to override for some specific pages, maybe
      pageTransitionsTheme: const PageTransitionsTheme(builders: {
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      }),
    );
  }

  static TextStyle getGreyTextStyle(context) => Theme.of(context)
      .textTheme
      .bodyText1
      .copyWith(color: Colors.grey.shade700);
  static const MaterialColor primaryColorSwatch =
      MaterialColor(0xFF1c1c1e, swatch);
  // const MaterialColor(0xFFf11771, swatch);

  static const Map<int, Color> swatch = {
    // 50: const Color(0xFFf4e1e1),
    // 100: const Color(0xFFe3b4b4),
    // 200: const Color(0xFFd18383),
    // 300: const Color(0xFFbf5151),
    // 400: const Color(0xFFb12b2b),
    // 500: const Color(0xFFa30606),
    // 600: const Color(0xFF9b0505),
    // 700: const Color(0xFF910404),
    // 800: const Color(0xFF880303),
    // 900: const Color(0xFF770202),

    50: Color(0xFFE4E4E4),
    100: Color(0xFFBBBBBC),
    200: Color(0xFF8E8E8F),
    300: Color(0xFF606062),
    400: Color(0xFF3E3E40),
    500: Color(0xFF1c1c1e),
    600: Color(0xFF19191A),
    700: Color(0xFF141416),
    800: Color(0xFF111112),
    900: Color(0xFF09090A),

    // 900: const Color(0xFFf22173),
    // 800: const Color(0xFFf42c75),
    // 700: const Color(0xFFf53677),
    // 600: const Color(0xFFf74179),
    // 500: const Color(0xFFf84b7b),
    // 400: const Color(0xFFf9557d),
    // 300: const Color(0xFFfb607f),
    // 200: const Color(0xFFfc6a81),
    // 100: const Color(0xFFfe7583),
    // 50: const Color(0xFFff7f84),
  };

  // Just an attempt because Material's greys/blacks aren't nice
  static const appleGray2 = Color.fromRGBO(99, 99, 102, 1);
  static const appleGray3 = Color.fromRGBO(72, 72, 74, 1);
  static const appleGray4 = Color.fromRGBO(58, 58, 60, 1);
  static const appleGray5 = Color.fromRGBO(44, 44, 46, 1);
  static const appleGray6 = Color.fromRGBO(28, 28, 30, 1);

  // 500 for primary
  static const primaryColor = Color(0xFF1c1c1e);
  // const Color(0xFFa30606);

  /// Notification Indicator color
  static final notificationColor = Colors.redAccent.shade700;

  /// Icons Primary Color
  // red
  static const iconPrimaryColor = Color(0xFFa30606);

  /// Icons Secondary Color
  // grey
  static const iconSecondaryColor = appleGray2;

  /// Icons Tertiary Color
  // black - for AppBars Mostly
  static const iconTertiaryColor = appleGray2;
}
