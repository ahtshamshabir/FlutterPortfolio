import 'package:flutter/material.dart';
import 'package:flutter_portfolio/themes/theme_mode_provider.dart';
import 'package:flutter_portfolio/utils/separate_widgets.dart';
import 'package:flutter_portfolio/utils/svg_icons.dart';
import 'package:flutter_portfolio/utils/theme_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IntroSection extends StatelessWidget {
  const IntroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Ink(
      height: double.infinity,
      width: double.infinity,
      color: Colors.blue,
      child: Center(
        child: Consumer(builder: (context, ref, _) {
          return InkWell(
            onTap: () {
              ref.read(themeModeProvider.notifier).toggle();
            },
            child: Text(
              'Intro Section',
              style: Theme.of(context).textTheme.headline1,
            ),
          );
        }),
      ),
    );
  }
}
