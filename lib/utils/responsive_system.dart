import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_portfolio/models/breakpoint.dart';
import 'package:flutter_portfolio/utils/dynamic_scaler.dart';

var breakpoints = [
  Breakpoint(type: BreakpointType.scale, maxWidth: 2560),
  Breakpoint(type: BreakpointType.pause, maxWidth: 1728),
  Breakpoint(type: BreakpointType.scale, maxWidth: 1200),
  Breakpoint(type: BreakpointType.scale, maxWidth: 1000),
];


double getResponsiveWidth(double width) {
  var currentIndex = 0;
  for (var i = 0; i < breakpoints.length; i++) {
    if (deviceSize.width < breakpoints[i].maxWidth) {
      currentIndex = i;
    }
  }
  print('currentIndex: $currentIndex');
  var current = breakpoints[currentIndex];
  double scaleFactor = 1;
  if(current.type == BreakpointType.scale) {
    scaleFactor = deviceSize.width / referenceSize.width;
  } else if(current.type == BreakpointType.pause){
    scaleFactor = current.maxWidth / referenceSize.width;
  }
  double scaledWidth  = width * scaleFactor;
  print('scaleFactor: $scaleFactor');
  print('scaledWidth: $scaledWidth');
  print('deviceSize: $deviceSize');
  print('bp: $current');
  //calculate scaled width

  return scaledWidth;
}
