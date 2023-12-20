// iphone 14 screen size 844 x 390
import 'package:flutter/material.dart';

enum DeviceSizeType {
  desktopSmall,
  desktopMedium,
  desktopLarge,
  desktopXLarge,
  mobileSmall,
  mobileMedium,
  mobileLarge,
  ;

  bool get isDesktopSmall => this == DeviceSizeType.desktopSmall;

  bool get isDesktopMedium => this == DeviceSizeType.desktopMedium;

  bool get isDesktopLarge => this == DeviceSizeType.desktopLarge;

  bool get isDesktopXLarge => this == DeviceSizeType.desktopXLarge;

  bool get isMobileSmall => this == DeviceSizeType.mobileSmall;

  bool get isMobileMedium => this == DeviceSizeType.mobileMedium;

  bool get isMobileLarge => this == DeviceSizeType.mobileLarge;

  bool get isDesktop => isDesktopSmall || isDesktopMedium || isDesktopLarge || isDesktopXLarge;

  bool get isMobile => isMobileSmall || isMobileMedium || isMobileLarge;
}

Size deviceSize = const Size(0, 0), referenceSize = const Size(1728, 918);

DeviceSizeType deviceSizeType = DeviceSizeType.desktopMedium;

var breakPointsMap = {
  DeviceSizeType.desktopXLarge: 2560,
  DeviceSizeType.desktopLarge: 1728,
  DeviceSizeType.desktopMedium: 1329,
  DeviceSizeType.desktopSmall: 1000,
  DeviceSizeType.mobileLarge: 430,
  DeviceSizeType.mobileMedium: 375,
  DeviceSizeType.mobileSmall: 320,
};

void setDeviceSize(Size size) {
  deviceSize = size;

  for (var item in breakPointsMap.entries) {
    if (deviceSize.width < item.value) {
      deviceSizeType = item.key;
    }
  }
}

TextStyle scaleFont(TextStyle textTheme) {
  double fontSize = textTheme.fontSize ?? 16;
  if (deviceSizeType == DeviceSizeType.desktopSmall) {
    return textTheme.copyWith(fontSize: fontSize - 3);
  } else if (deviceSizeType == DeviceSizeType.desktopMedium) {
    return textTheme.copyWith(fontSize: fontSize);
  } else {
    return textTheme.copyWith(fontSize: fontSize + 2);
  }
}

double scaleWrtHeight(double unit) {
  return (unit * deviceSize.height) / referenceSize.height;
}

double scaleWrtWidth(double unit) {
  return (unit * deviceSize.width) / referenceSize.width;
}

double viewWidth(double percent) {
  return (percent / 100) * deviceSize.width;
}

double viewHeight(double percent) {
  return (percent / 100) * deviceSize.height;
}

extension DynamicScaler on num {
  double get sw => scaleWrtWidth(toDouble());

  double get sh => scaleWrtHeight(toDouble());

  double get vh => viewHeight(toDouble());

  double get vw => viewWidth(toDouble());
}

extension TextStyleEXT on TextStyle {
  TextStyle get scaled => scaleFont(this);
}

extension PercentExt on num {
  double percentOf(num number) => (this / 100) * number;
}
