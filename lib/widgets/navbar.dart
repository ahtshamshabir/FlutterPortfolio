import 'package:flutter/material.dart';
import 'package:flutter_portfolio/utils/separate_widgets.dart';

class Navbar extends StatelessWidget {
  List<NavItem> items;
  int currentIndex;
  double iconSize;
  EdgeInsetsGeometry? iconPadding, padding;

  Navbar({
    super.key,
    required this.currentIndex,
    this.items = const [],
    this.iconSize = 60,
    this.iconPadding,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var colorScheme = theme.colorScheme;
    return Material(
      color: Colors.transparent,
      child: Ink(
        padding: padding ?? const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ...separateWidgets(
              [
                for (int i = 0; i < items.length; i++)
                  InkWell(
                    onTap: items[i].onPressed,
                    borderRadius: BorderRadius.circular(20),
                    child: Tooltip(
                      message: items[i].title,
                      textStyle: theme.textTheme.bodySmall!.copyWith(color: colorScheme.onBackground),
                      verticalOffset: 0,
                      decoration: ShapeDecoration(
                        color: colorScheme.background,
                        //todo: add a custom shape here for tooltip
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      waitDuration: const Duration(milliseconds: 0),
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Ink(
                          padding: iconPadding ?? const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: i == currentIndex ? colorScheme.background : null,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Icon(
                            items[i].icon,
                            color: colorScheme.onBackground,
                            size: iconSize,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
              const SizedBox(height: 10),
            ),
          ],
        ),
      ),
    );
  }
}

class NavItem {
  final String title;
  final IconData icon;
  Function()? onPressed;

  NavItem({
    required this.title,
    required this.icon,
    this.onPressed,
  });
}
