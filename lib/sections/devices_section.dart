import 'package:flutter/material.dart';
import 'package:flutter_portfolio/utils/dynamic_scaler.dart';
import 'package:flutter_portfolio/utils/theme_utils.dart';
import 'package:flutter_portfolio/widgets/section_surface.dart';

class DevicesSection extends StatelessWidget with ThemeUtils {
  DevicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    initThemeUtils(context);
    return SectionSurface(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: colorScheme.surfaceVariant,
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.all(10),
        child: ClipRRect(
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(20),
          child: SingleChildScrollView(
            child: Container(
              height: 200.vh,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [
                    colorScheme.primary,
                    colorScheme.primary.withOpacity(0.1),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
