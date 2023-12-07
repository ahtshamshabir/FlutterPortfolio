import 'package:flutter/material.dart';
import 'package:flutter_portfolio/utils/font_family.dart';

var lightThemeData = ThemeData(
  colorScheme: lightColorScheme,
  textTheme: lightThemeTextScheme,
  useMaterial3: true,
);

var lightThemeTextScheme = Typography.blackMountainView.copyWith(
  displayLarge: TextStyle(
    color: Colors.black,
    fontFamily: FontFamily.inter,
  ),
  displayMedium: TextStyle(
    color: Colors.black,
    fontFamily: FontFamily.inter,
  ),
  displaySmall: TextStyle(
    color: Colors.black,
    fontFamily: FontFamily.inter,
  ),
  headlineLarge: TextStyle(
    color: Colors.black,
    fontFamily: FontFamily.inter,
  ),
  headlineMedium: TextStyle(
    color: Colors.black,
    fontFamily: FontFamily.inter,
  ),
  headlineSmall: TextStyle(
    color: Colors.black,
    fontFamily: FontFamily.inter,
  ),
  titleLarge: TextStyle(
    color: Colors.black,
    fontFamily: FontFamily.inter,
  ),
  titleMedium: TextStyle(
    color: Colors.black,
    fontFamily: FontFamily.inter,
  ),
  titleSmall: TextStyle(
    color: Colors.black,
    fontFamily: FontFamily.inter,
  ),
  bodyLarge: TextStyle(
    color: Colors.black,
    fontFamily: FontFamily.inter,
  ),
  bodyMedium: TextStyle(
    color: Colors.black,
    fontFamily: FontFamily.inter,
  ),
  bodySmall: TextStyle(
    color: Colors.black,
    fontFamily: FontFamily.inter,
  ),
  labelLarge: TextStyle(
    color: Colors.black,
    fontFamily: FontFamily.inter,
  ),
  labelMedium: TextStyle(
    color: Colors.black,
    fontFamily: FontFamily.inter,
  ),
  labelSmall: TextStyle(
    color: Colors.black,
    fontFamily: FontFamily.inter,
  ),
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
