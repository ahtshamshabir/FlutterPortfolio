import 'package:flutter/material.dart';

class AppColors extends ThemeExtension<AppColors> {
  final Color cardColor;

  const AppColors({
    required this.cardColor,
  });

  @override
  ThemeExtension<AppColors> copyWith({Color? cardColor}) {
    return AppColors(
      cardColor: cardColor ?? this.cardColor,
    );
  }

  @override
  ThemeExtension<AppColors> lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    return AppColors(
      cardColor: Color.lerp(cardColor, other.cardColor, t)!,
    );
  }
}
