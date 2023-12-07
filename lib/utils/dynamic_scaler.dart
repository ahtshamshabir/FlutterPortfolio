// iphone 14 screen size 844 x 390
import 'package:flutter/material.dart';

enum DeviceSize { small, medium, large }

double referenceHeight = 844;
double referenceWidth = 393;

double deviceHeight = 0;
double deviceWidth = 0;

DeviceSize deviceSize = DeviceSize.medium;

void setDeviceSize(Size size) {
  deviceHeight = size.height;
  deviceWidth = size.width;

  if (deviceHeight < 700) {
    deviceSize = DeviceSize.small;
  } else if (deviceHeight > 900) {
    deviceSize = DeviceSize.large;
  } else {
    deviceSize = DeviceSize.medium;
  }
}

TextStyle scaleFont(TextStyle textTheme) {
  double fontSize = textTheme.fontSize ?? 16;
  if (deviceSize == DeviceSize.small) {
    return textTheme.copyWith(fontSize: fontSize - 3);
  } else if (deviceSize == DeviceSize.medium) {
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
