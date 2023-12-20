import 'package:flutter/material.dart';

mixin ThemeUtils {
  late ThemeData theme;
  late ColorScheme colorScheme;
  late TextTheme textTheme;

  void initThemeUtils(BuildContext context) {
    theme = Theme.of(context);
    colorScheme = theme.colorScheme;
    textTheme = theme.textTheme;
  }
}

mixin MediaQueryReadUtils {
  late MediaQueryData mediaQuery;

  void initQueryRead(BuildContext context) {
    mediaQuery = context.getInheritedWidgetOfExactType<MediaQuery>()!.data;
  }
}
