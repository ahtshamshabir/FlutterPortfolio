import 'package:flutter/material.dart';
import 'package:flutter_portfolio/utils/separate_widgets.dart';
import 'package:flutter_portfolio/utils/svg_icons.dart';
import 'package:flutter_portfolio/utils/theme_utils.dart';

class AppHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Material(
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SocialHeader(
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(5),
                  onTap: () {
                    print('tapped');
                  },
                  child: SvgIcons.linkedin,
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(5),
                  onTap: () {
                    print('tapped');
                  },
                  child: SvgIcons.github,
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(5),
                  onTap: () {
                    print('tapped');
                  },
                  child: SvgIcons.youtube,
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(5),
                  onTap: () {
                    print('tapped');
                  },
                  child: SvgIcons.instagram,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SocialHeader extends StatelessWidget with ThemeUtils {
  final List<Widget> children;

  SocialHeader({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    initThemeUtils(context);
    return Ink(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
                height: 30,
                width: 30,
                child: e,
              ),
            ),
            const SizedBox(width: 30),
          ),
        ],
      ),
    );
  }
}
