import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_portfolio/models/breakpoint.dart';
var breakpoints = [
  Breakpoint(type: BreakpointType.resize, maxWidth: 1728),
  Breakpoint(type: BreakpointType.scale, maxWidth: 1440),
  Breakpoint(type: BreakpointType.scale, maxWidth: 1000),
];

Size deviceSize = const Size(0, 0), referenceSize = const Size(1728, 918);

double getResponsiveWidth(double width) {
  var currentIndex = 0;
  for (var i = 0; i < breakpoints.length; i++) {
    if (deviceSize.width < breakpoints[i].maxWidth) {
      currentIndex = i;
    }
  }
  print('currentIndex: $currentIndex');
  var current = breakpoints[currentIndex];
  var previous = currentIndex > 0 ?  breakpoints[currentIndex - 1] : null;
  var next = currentIndex < breakpoints.length - 1 ? breakpoints[currentIndex + 1] : null;
  print(current);
  print(previous);
  if(current.type == BreakpointType.resize) {
    return width;
  } else {
    double t = (deviceSize.width - next!.maxWidth) / (current.maxWidth - next.maxWidth);
    double lerped = lerpDouble(0, width, t)!;
    return lerped;
  }
}
