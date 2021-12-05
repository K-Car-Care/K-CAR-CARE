// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ThemeConstant {
  static const List<String> fontFamilyFallback = [
    'OpenSans',
  ];

  static const Gradient greenGradient = LinearGradient(
    colors: [
      Color(0xFF4CAF50),
      Color(0xFF388E3C),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const Gradient orangeGradient = LinearGradient(
    colors: [
      Color(0xFFFF9800),
      Color(0xFFF57C00),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const Gradient blueGradient = LinearGradient(
    colors: [
      Color(0xFF2196F3),
      Color(0xFF1976D2),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const Gradient redGradient = LinearGradient(
    colors: [
      Color(0xFFF44336),
      Color(0xFFD32F2F),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const Gradient purpleGradient = LinearGradient(
    colors: [
      Color(0xFF9C27B0),
      Color(0xFF7B1FA2),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const Gradient greyGradient = LinearGradient(
    colors: [
      Color(0xFF607D8B),
      Color(0xFF455A64),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const ColorScheme darkScheme = ColorScheme(
    primary: Color(0xFFD30101),
    primaryVariant: Color(0xFF990000),
    secondary: Color(0xFF8B9299),
    secondaryVariant: Color(0xFFBFBFBF),
    background: Color(0xFF161F28),
    surface: Color(0xFF172634),
    error: Color(0xFFB00020),
    onPrimary: Color(0xFFFFFFFF),
    onSecondary: Color(0xFFFFFFFF),
    onBackground: Color(0xFFFFFFFF),
    onSurface: Color(0xFFFFFFFF),
    onError: Color(0xFFFFFFFF),
    brightness: Brightness.light,
  );

  static const ColorScheme lightScheme = ColorScheme(
    primary: Color(0xFFD30101),
    primaryVariant: Color(0xFF990000),
    secondary: Color(0xFF8B9299),
    secondaryVariant: Color(0xFFBFBFBF),
    background: Color(0xFF161F28),
    surface: Color(0xFF172634),
    error: Color(0xFFB00020),
    onPrimary: Color(0xFFFFFFFF),
    onSecondary: Color(0xFFFFFFFF),
    onBackground: Color(0xFFFFFFFF),
    onSurface: Color(0xFFFFFFFF),
    onError: Color(0xFFFFFFFF),
    brightness: Brightness.light,
  );

  static TextTheme get textTheme => const TextTheme(
        headline1: TextStyle(
          fontSize: 93,
          fontWeight: FontWeight.w300,
          fontFamily: 'Poppins',
          letterSpacing: -1.5,
        ),
        headline2: TextStyle(
          fontSize: 58,
          fontWeight: FontWeight.w300,
          letterSpacing: -0.5,
          fontFamily: 'Poppins',
        ),
        headline3: TextStyle(
          fontSize: 46,
          fontWeight: FontWeight.w400,
          fontFamily: 'Poppins',
          // backgroundColor: Colors.blue,
        ),
        headline4: TextStyle(
          fontSize: 33,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
          fontFamily: 'Poppins',
        ),
        headline5: TextStyle(
          fontSize: 23,
          fontWeight: FontWeight.w400,
          fontFamily: 'Poppins',
        ),
        headline6: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.15,
          fontFamily: 'Poppins',
        ),
        subtitle1: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.15,
          fontFamily: 'Poppins',
        ),
        subtitle2: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.1,
          fontFamily: 'Poppins',
        ),
        bodyText1: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5,
          fontFamily: 'Poppins',
        ),
        bodyText2: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
          fontFamily: 'Poppins',
        ),
        button: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.25,
          fontFamily: 'Poppins',
        ),
        caption: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.4,
          fontFamily: 'Poppins',
        ),
        overline: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.5,
          fontFamily: 'Poppins',
        ),
      ).apply(
        displayColor: lightScheme.onSurface,
        bodyColor: lightScheme.onSurface,
        decorationColor: lightScheme.onSurface,
      );


}
