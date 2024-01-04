import 'package:flutter/material.dart';
import 'package:flutter_portfolio/utils/dynamic_scaler.dart';
import 'package:flutter_portfolio/utils/separate_widgets.dart';
import 'package:flutter_portfolio/utils/svg_icons.dart';
import 'package:flutter_portfolio/utils/theme_utils.dart';
import 'package:flutter_portfolio/widgets/brightness_mode_toggle.dart';
import 'package:flutter_portfolio/widgets/header_download_button.dart';
import 'package:flutter_portfolio/widgets/social_header.dart';

class AppHeader extends StatelessWidget {
  double get paddingTop {
    if (deviceSizeType.isDesktop) {
      return 40;
    } else {
      return 10;
    }
  }

  @override
  Widget build(BuildContext context) {
    const sizedBox = SizedBox(width: double.infinity);
    return Container(
      margin: EdgeInsets.only(top: paddingTop),
      child: Material(
        color: Colors.transparent,
        child: Row(
          children: [
            Flexible(
              flex: deviceSizeType.isDesktop ? 43 : 6,
              child: sizedBox,
            ),
            AppSocialHeader(),
            Flexible(
              flex: deviceSizeType.isDesktop ? 1 : 6,
              child: sizedBox,
            ),
            AppHeaderDownloadButton(),
            const Flexible(
              flex: 22,
              child: sizedBox,
            ),
            BrightnessModeToggle(),
            const Flexible(
              flex: 6,
              child: sizedBox,
            ),
          ],
        ),
      ),
    );
  }
}

class AppSocialHeader extends StatelessWidget with ThemeUtils {
  EdgeInsets get padding {
    if (deviceSizeType.isDesktop) {
      return const EdgeInsets.symmetric(horizontal: 15, vertical: 10);
    } else {
      return const EdgeInsets.symmetric(horizontal: 8, vertical: 7);
    }
  }

  double get iconSize {
    if (deviceSizeType.isDesktop) {
      return 30;
    } else {
      return 15;
    }
  }

  @override
  Widget build(BuildContext context) {
    initThemeUtils(context);
    return SocialHeader(
      padding: padding,
      iconSize: iconSize,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(5),
          onTap: () {
            print('tapped');
          },
          child: SvgIcons.linkedin.toPng(),
        ),
        InkWell(
          borderRadius: BorderRadius.circular(5),
          onTap: () {
            print('tapped');
          },
          child: SvgIcons.github.toPng(),
        ),
        InkWell(
          borderRadius: BorderRadius.circular(5),
          onTap: () {
            print('tapped');
          },
          child: SvgIcons.youtube.toPng(),
        ),
        InkWell(
          borderRadius: BorderRadius.circular(5),
          onTap: () {
            print('tapped');
          },
          child: SvgIcons.instagram.toPng(),
        ),
      ],
    );
  }
}

class AppHeaderDownloadButton extends StatelessWidget with ThemeUtils {
  EdgeInsets get padding {
    if (deviceSizeType.isDesktop) {
      return const EdgeInsets.symmetric(horizontal: 15, vertical: 8);
    } else {
      return const EdgeInsets.symmetric(horizontal: 12, vertical: 8);
    }
  }

  double get iconSize {
    if (deviceSizeType.isDesktop) {
      return 25;
    } else {
      return 15;
    }
  }

  @override
  Widget build(BuildContext context) {
    initThemeUtils(context);
    return HeaderDownloadButton(
      onPressed: () {},
      padding: padding,
      iconSize: iconSize,
      title: Text(
        'CV',
        style: textTheme.bodyMedium!
            .copyWith(
              fontWeight: FontWeight.bold,
            )
            .scaleMinMax(min: 10, max: 25),
      ),
    );
  }
}
