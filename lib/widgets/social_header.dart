import 'package:flutter/material.dart';
import 'package:flutter_portfolio/utils/separate_widgets.dart';
import 'package:flutter_portfolio/utils/theme_utils.dart';

class SocialHeader extends StatelessWidget with ThemeUtils {
  final List<Widget> children;
  EdgeInsets? padding;
  double iconSize;

  SocialHeader({
    super.key,
    this.padding,
    this.iconSize = 30,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    initThemeUtils(context);
    return Ink(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ...separateWidgets(
            children.map(
              (e) => SizedBox(
                height: iconSize,
                width: iconSize,
                child: e,
              ),
            ),
            SizedBox(width: iconSize),
          ),
        ],
      ),
    );
  }
}
