// iphone 14 screen size 844 x 390
import 'package:flutter/material.dart';
import 'package:flutter_portfolio/utils/responsive_system.dart';

enum DeviceSizeType {
  small,
  medium,
  large,
  xlarge,
  ;

  bool get isSmall => this == DeviceSizeType.small;

  bool get isMedium => this == DeviceSizeType.medium;

  bool get isLarge => this == DeviceSizeType.large;

  bool get isXLarge => this == DeviceSizeType.xlarge;
}

double referenceHeight = 844;
double referenceWidth = 393;

double deviceHeight = 0;
double deviceWidth = 0;

DeviceSizeType deviceSizeType = DeviceSizeType.medium;

var breakPointsMap = {
  DeviceSizeType.xlarge: 2560,
  DeviceSizeType.large: 1728,
  DeviceSizeType.medium: 1329,
  DeviceSizeType.small: 1000,
};

void setDeviceSize(Size size) {
  deviceHeight = size.height;
  deviceWidth = size.width;
  deviceSize = size;

  for (var item in breakPointsMap.entries) {
    if (deviceWidth < item.value) {
      deviceSizeType = item.key;
    }
  }
}

TextStyle scaleFont(TextStyle textTheme) {
  double fontSize = textTheme.fontSize ?? 16;
  if (deviceSizeType == DeviceSizeType.small) {
    return textTheme.copyWith(fontSize: fontSize - 3);
  } else if (deviceSizeType == DeviceSizeType.medium) {
    return textTheme.copyWith(fontSize: fontSize);
  } else {
    return textTheme.copyWith(fontSize: fontSize + 2);
  }
}

double scaleWrtHeight(double unit) {
  return (unit * deviceHeight) / referenceHeight;
}

double scaleWrtWidth(double unit) {
  return (unit * deviceWidth) / referenceWidth;
}

double viewWidth(double percent) {
  return (percent / 100) * deviceWidth;
}

double viewHeight(double percent) {
  return (percent / 100) * deviceHeight;
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
