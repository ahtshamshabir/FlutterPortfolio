import 'package:flutter/material.dart';
import 'package:flutter_portfolio/utils/dynamic_scaler.dart';
import 'package:flutter_portfolio/utils/theme_utils.dart';

class SectionSurface extends StatelessWidget with ThemeUtils {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  SectionSurface({super.key, required this.child, this.padding});
  @override
  Widget build(BuildContext context) {
    initThemeUtils(context);
    return Ink(
        height: double.infinity,
        width: double.infinity,
        color: colorScheme.background,
        padding: padding ?? EdgeInsets.all(5.vw),
    child: child,
    );
  }

}
