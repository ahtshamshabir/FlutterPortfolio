import 'package:flutter/material.dart';
import 'package:flutter_portfolio/utils/dynamic_scaler.dart';
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
            const Flexible(
              flex: 43,
              child: SizedBox(width: double.infinity),
            ),
            AppSocialHeader(),
            const Flexible(
              flex: 1,
              child: SizedBox(width: double.infinity),
            ),
            AppHeaderDownloadButton(),
            const Flexible(
              flex: 22,
              child: SizedBox(width: double.infinity),
            ),
            BrightnessModeToggle(),
            const Flexible(
              flex: 6,
              child: SizedBox(width: double.infinity),
            ),
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
