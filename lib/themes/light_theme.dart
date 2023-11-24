import 'package:flutter/material.dart';

var lightThemeData = ThemeData(
  colorScheme: lightColorScheme,
  textTheme: Typography.blackMountainView,
  useMaterial3: true,
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
