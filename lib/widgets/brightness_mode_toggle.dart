import 'package:flutter/material.dart';
import 'package:flutter_portfolio/themes/theme_mode_provider.dart';
import 'package:flutter_portfolio/utils/dynamic_scaler.dart';
import 'package:flutter_portfolio/utils/theme_utils.dart';
import 'package:flutter_portfolio/widgets/segmented_toggle.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BrightnessModeToggle extends StatelessWidget with ThemeUtils {
  @override
  Widget build(BuildContext context) {
    initThemeUtils(context);
    return Consumer(
      builder: (context, ref, _) {
        var themeMode = ref.watch(themeModeProvider);
        return Container(
          height: 40,
          width: 130,
          child: SegmentedToggle(
            value: themeMode,
            onChanged: (mode) {
              ref.read(themeModeProvider.notifier).setThemeMode(mode);
            },
            children: {
              ThemeMode.light: Icon(
                Icons.wb_sunny,
                color: colorScheme.onBackground,
                size: 45,
              ),
              ThemeMode.dark: Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationZ(-0.5)..translate(-3),
                child: Icon(
                  Icons.nightlight_round,
                  color: colorScheme.onBackground,
                  size: 45,
                ),
              ),
              ThemeMode.system: Icon(
                Icons.settings,
                color: colorScheme.onBackground,
                size: 45,
              ),
            },
          ),
        );
      }
    );
  }
}
