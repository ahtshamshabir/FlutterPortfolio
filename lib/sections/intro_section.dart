import 'package:flutter/material.dart';
import 'package:flutter_portfolio/utils/dynamic_scaler.dart';
import 'package:flutter_portfolio/utils/dynamic_scaler.dart';
import 'package:flutter_portfolio/utils/font_family.dart';
import 'package:flutter_portfolio/utils/svg_icons.dart';
import 'package:flutter_portfolio/utils/svg_to_png.dart';
import 'package:flutter_portfolio/utils/theme_utils.dart';

class IntroSection extends StatelessWidget with ThemeUtils {
  IntroSection({super.key});

  @override
  Widget build(BuildContext context) {
    initThemeUtils(context);
    return Ink(
      height: double.infinity,
      width: double.infinity,
      color: colorScheme.background,
      padding: const EdgeInsets.only(left: 100, right: 150),
      child: Row(
        children: [
          InfoSection(),
          const Spacer(),
          Container(
            height: 200,
            width: 200,
            child: FittedBox(
              child: FutureBuilder(
                  future: svgStringToPngBytes('assets/icons/blender.svg', context),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Image.memory(snapshot.data!);
                    } else if (snapshot.error != null) {
                      print(snapshot.error);
                      print((snapshot.error as Error).stackTrace);
                      return Text(snapshot.error.toString());
                    }
                    return Container();
                  }),
            ),
          ),
          AvatarSection(),
        ],
      ),
    );
  }
}

class InfoSection extends StatelessWidget with ThemeUtils {
  @override
  Widget build(BuildContext context) {
    initThemeUtils(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '''Column(
  children: [''',
          style: textTheme.bodyLarge!.copyWith(
            fontFamily: FontFamily.sourceCodePro,
            color: colorScheme.onBackground.withOpacity(0.25),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Raja',
                      style: textTheme.displayLarge?.copyWith(
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    TextSpan(
                      text: ' ',
                      style: textTheme.displayLarge,
                    ),
                    TextSpan(
                      text: 'Ahtsham Shabir',
                      style: textTheme.displayLarge?.copyWith(
                        color: colorScheme.primary,
                      ),
                    ),
                  ],
                  style: textTheme.headlineLarge,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Software Engineer',
                style: textTheme.headlineMedium,
              ),
              const SizedBox(height: 10),
              Text(
                'I believe anything is possible with Flutter.',
                style: textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        Text(
          '''  ],
);''',
          style: textTheme.bodyLarge?.copyWith(
            fontFamily: FontFamily.sourceCodePro,
            color: colorScheme.onBackground.withOpacity(0.25),
          ),
        ),
      ],
    );
  }
}

class AvatarSection extends StatelessWidget with ThemeUtils {
  AvatarSection({super.key});

  @override
  Widget build(BuildContext context) {
    initThemeUtils(context);
    return Container(
      height: 34.vw,
      width: 34.vw,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 28.vw,
            width: 28.vw,
            padding: EdgeInsets.all(3.vw),
            decoration: BoxDecoration(
              color: colorScheme.surface,
              borderRadius: BorderRadius.circular(20.vw),
            ),
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/flutter-dash.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            left: 0.8.vw,
            top: 11.vw,
            child: Container(
              height: 6.vw,
              width: 6.vw,
              decoration: BoxDecoration(
                color: colorScheme.tertiary,
                borderRadius: BorderRadius.circular(20.vw),
              ),
            ),
          ),
          Positioned(
            right: 0.8.vw,
            top: 5.vw,
            child: Container(
              height: 8.4.vw,
              width: 8.4.vw,
              decoration: BoxDecoration(
                color: colorScheme.inversePrimary,
                borderRadius: BorderRadius.circular(20.vw),
              ),
            ),
          ),
          Positioned(
            left: 0.8.vw,
            top: 11.vw,
            child: Container(
              height: 6.vw,
              width: 6.vw,
              decoration: BoxDecoration(
                color: colorScheme.tertiary,
                borderRadius: BorderRadius.circular(20.vw),
              ),
            ),
          ),
          Positioned(
            left: 15.vw,
            bottom: 0.vw,
            child: Container(
              height: 6.3.vw,
              width: 6.3.vw,
              decoration: BoxDecoration(
                color: colorScheme.inverseSurface,
                borderRadius: BorderRadius.circular(20.vw),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
