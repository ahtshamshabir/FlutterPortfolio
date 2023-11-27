import 'package:flutter/material.dart';
import 'package:flutter_portfolio/utils/separate_widgets.dart';
import 'package:flutter_portfolio/utils/svg_icons.dart';
import 'package:flutter_portfolio/utils/theme_utils.dart';
import 'package:flutter_portfolio/widgets/brightness_mode_toggle.dart';
import 'package:flutter_portfolio/widgets/header_download_button.dart';
import 'package:flutter_portfolio/widgets/social_header.dart';

class AppHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Material(
        color: Colors.transparent,
        child: Row(
          children: [
            const SizedBox(width: 800),
            AppSocialHeader(),
            const SizedBox(width: 25),
            AppHeaderDownloadButton(),
            const SizedBox(width: 350),
            BrightnessModeToggle(),
          ],
        ),
      ),
    );
  }
}

class AppSocialHeader extends StatelessWidget with ThemeUtils {
  @override
  Widget build(BuildContext context) {
    initThemeUtils(context);
    return SocialHeader(
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
          child: SvgIcons.github.copyWith(
            color: colorScheme.onBackground,
          ),
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
    );
  }
}

class AppHeaderDownloadButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HeaderDownloadButton(
      onPressed: () {},
      title: const Text('CV'),
    );
  }
}
