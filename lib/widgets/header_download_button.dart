import 'package:flutter/material.dart';
import 'package:flutter_portfolio/utils/theme_utils.dart';

class HeaderDownloadButton extends StatelessWidget with ThemeUtils {
  final Widget title;
  Function()? onPressed;

  HeaderDownloadButton({super.key, required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    initThemeUtils(context);
    const borderRadius = BorderRadius.all(Radius.circular(30));
    return InkWell(
      onTap: onPressed,
      borderRadius: borderRadius,
      child: Ink(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: borderRadius,
        ),
        child: Row(
          children: [
            DefaultTextStyle(
              style: textTheme.bodyMedium!.copyWith(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              child: title,
            ),
            const SizedBox(width: 10),
            Icon(
              Icons.download_outlined,
              color: colorScheme.onBackground,
              size: 25,
            ),
          ],
        ),
      ),
    );
  }
}
