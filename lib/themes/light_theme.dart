import 'package:flutter/material.dart';
import 'package:flutter_portfolio/utils/colorize_text_theme.dart';
import 'package:flutter_portfolio/utils/font_family.dart';

var lightThemeData = ThemeData(
  colorScheme: lightColorScheme,
  textTheme: lightThemeTextScheme,
  useMaterial3: true,
);

var lightThemeTextScheme = colorizeTextTheme(
  textTheme: Typography.blackMountainView.copyWith(
    displayLarge: TextStyle(
      fontFamily: FontFamily.inter,
      fontSize: 74,
      fontWeight: FontWeight.w400,
    ),
    displayMedium: TextStyle(
      fontFamily: FontFamily.inter,
    ),
    displaySmall: TextStyle(
      fontFamily: FontFamily.inter,
    ),
    headlineLarge: TextStyle(
      fontFamily: FontFamily.inter,
      fontSize: 40,
      fontWeight: FontWeight.w700,
    ),
    headlineMedium: TextStyle(
      fontFamily: FontFamily.inter,
      fontSize: 33,
      fontWeight: FontWeight.w500,
    ),
    headlineSmall: TextStyle(
      fontFamily: FontFamily.inter,
      fontSize: 29,
      fontWeight: FontWeight.w400,
    ),
    titleLarge: TextStyle(
      fontFamily: FontFamily.inter,
    ),
    titleMedium: TextStyle(
      fontFamily: FontFamily.inter,
    ),
    titleSmall: TextStyle(
      fontFamily: FontFamily.inter,
    ),
    bodyLarge: TextStyle(
      fontFamily: FontFamily.inter,
      fontSize: 30,
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: TextStyle(
      fontFamily: FontFamily.inter,
      fontSize: 26,
      fontWeight: FontWeight.w400,
    ),
    bodySmall: TextStyle(
      fontFamily: FontFamily.inter,
      fontSize: 22,
      fontWeight: FontWeight.w400,
    ),
    labelLarge: TextStyle(
      fontFamily: FontFamily.inter,
    ),
    labelMedium: TextStyle(
      fontFamily: FontFamily.inter,
    ),
    labelSmall: TextStyle(
      fontFamily: FontFamily.inter,
    ),
  ),
  color: Colors.black,
);

var lightColorScheme = const ColorScheme(
  brightness: Brightness.light,
  primary: Colors.red,
  onPrimary: Color(0xFFFFFFFF),
  secondary: Color(0xFF03DAC6),
  onSecondary: Color(0xFF000000),
  error: Color(0xFFB00020),
  onError: Color(0xFFFFFFFF),
  background: Color(0xFF03DAC6),
  onBackground: Color(0xFF000000),
  surface: Color(0xFFFFFFFF),
  onSurface: Color(0xFF000000),
);
