import 'package:flutter/material.dart';
import 'package:flutter_portfolio/utils/theme_utils.dart';

class HeaderDownloadButton extends StatelessWidget with ThemeUtils {
  final Widget title;
  Function()? onPressed;
  EdgeInsets? padding;
  double iconSize;

  HeaderDownloadButton({
    super.key,
    required this.title,
    this.onPressed,
    this.padding,
    this.iconSize = 25,
  });

  @override
  Widget build(BuildContext context) {
    initThemeUtils(context);
    const borderRadius = BorderRadius.all(Radius.circular(30));
    return InkWell(
      onTap: onPressed,
      borderRadius: borderRadius,
      child: Ink(
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: borderRadius,
        ),
        child: Row(
          children: [
            title,
            const SizedBox(width: 10),
            Icon(
              Icons.download_outlined,
              color: colorScheme.onBackground,
              size: iconSize,
            ),
          ],
        ),
      ),
    );
  }
}
