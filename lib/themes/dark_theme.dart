import 'package:flutter/material.dart';

var darkThemeData = ThemeData(
  colorScheme: darkColorScheme,
  textTheme: Typography.whiteMountainView,
  useMaterial3: true,
);

var darkColorScheme = const ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFFBB86FC),
  onPrimary: Color(0xFF000000),
  secondary: Color(0xFF03DAC6),
  onSecondary: Color(0xFF000000),
  error: Color(0xFFCF6679),
  onError: Color(0xFF000000),
  background: Color(0xFF181818),
  onBackground: Color(0xFFFFFFFF),
  surface: Color(0xFF3C3C3C),
  onSurface: Color(0xFF000000),
);
