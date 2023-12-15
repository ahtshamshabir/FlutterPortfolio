import 'package:flutter/material.dart';

TextTheme colorizeTextTheme({required TextTheme textTheme, required Color color}) {
  return textTheme.copyWith(
    displayLarge: TextStyle(
      color: color,
    ),
    displayMedium: TextStyle(
      color: color,
    ),
    displaySmall: TextStyle(
      color: color,
    ),
    headlineLarge: TextStyle(
      color: color,
    ),
    headlineMedium: TextStyle(
      color: color,
    ),
    headlineSmall: TextStyle(
      color: color,
    ),
    titleLarge: TextStyle(
      color: color,
    ),
    titleMedium: TextStyle(
      color: color,
    ),
    titleSmall: TextStyle(
      color: color,
    ),
    bodyLarge: TextStyle(
      color: color,
    ),
    bodyMedium: TextStyle(
      color: color,
    ),
    bodySmall: TextStyle(
      color: color,
    ),
    labelLarge: TextStyle(
      color: color,
    ),
    labelMedium: TextStyle(
      color: color,
    ),
    labelSmall: TextStyle(
      color: color,
    ),
  );
}
