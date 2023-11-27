import 'package:flutter/material.dart';

mixin ThemeUtils {
  late final ThemeData theme;
  late final ColorScheme colorScheme;
  late final TextTheme textTheme;

  void initThemeUtils(BuildContext context) {
    theme = Theme.of(context);
    colorScheme = theme.colorScheme;
    textTheme = theme.textTheme;
  }
}
