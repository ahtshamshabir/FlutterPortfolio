import 'package:flutter/material.dart';
import 'package:flutter_portfolio/themes/app_colors_extension.dart';
import 'package:flutter_portfolio/utils/colorize_text_theme.dart';
import 'package:flutter_portfolio/utils/font_family.dart';

var darkThemeData = ThemeData(
  colorScheme: darkColorScheme,
  textTheme: darkThemeTextScheme,
  cardColor: const Color(0xFF3C3C3C),
  extensions: const [
    AppColors(cardColor: Color(0xFF3C3C3C)),
  ],
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: darkThemeTextScheme.bodyMedium?.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 16,
      color: const Color(0xFFCAC4D0),
    ),
    prefixIconColor: const Color(0xFFCAC4D0),
    hintStyle: darkThemeTextScheme.bodyMedium?.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 16,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: Color(0xFF938F99),
        width: 1,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: darkColorScheme.primary,
        width: 2,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: Color(0xFF938F99),
        width: 1,
      ),
    ),
  ),
  useMaterial3: true,
  buttonTheme: const ButtonThemeData(
    buttonColor: Color(0xFF3BAADB),
    textTheme: ButtonTextTheme.primary,
  ),
  filledButtonTheme: FilledButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Color(0xFF3BAADB)),
      foregroundColor: MaterialStateProperty.all(darkColorScheme.onBackground),
      textStyle: MaterialStateProperty.all(
        TextStyle(
          fontFamily: FontFamily.inter,
          fontWeight: FontWeight.w700,
          fontSize: 16,
        ),
      ),
    ),
  ),
);

var darkThemeTextScheme = colorizeTextTheme(
  textTheme: Typography.whiteMountainView.copyWith(
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
  color: Colors.white,
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFF26DFFF),
  onPrimary: Color(0xFF000000),
  secondary: Color(0xFF786CFF),
  onSecondary: Color(0xFF000000),
  tertiary: Color(0xFFFF906C),
  error: Color(0xFFCF6679),
  onError: Color(0xFF000000),
  background: Color(0xFF181818),
  onBackground: Color(0xFFFFFFFF),
  surface: Color(0xFF3C3C3C),
  surfaceVariant: Color(0xFF232323),
  onSurface: Color(0xFF000000),
  inversePrimary: Color(0xFF786CFF),
  inverseSurface: Color(0xFFFF6C6C),
  primaryContainer: Color(0xFF3BAADB),
);
