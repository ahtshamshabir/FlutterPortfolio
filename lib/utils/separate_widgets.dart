import 'package:flutter/material.dart';

separateWidgets(Iterable<Widget> widgets, Widget separator) {
  List<Widget> result = [];
  for (var i = 0; i < widgets.length; i++) {
    result.add(widgets.elementAt(i));
    if (i != widgets.length - 1) {
      result.add(separator);
    }
  }
  return result;
}
