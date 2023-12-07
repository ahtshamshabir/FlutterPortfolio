import 'package:flutter/material.dart';

BuildContext? globalContext;

dynamic _runWithGlobalContext(Function func) {
  if (globalContext != null) {
    return func(globalContext);
  }
  else {
  }
}

dynamic showGlobalSnackBar(SnackBar snackBar) {
  return _runWithGlobalContext((context) => ScaffoldMessenger.of(context).showSnackBar(snackBar));
}

dynamic showGlobalDialog<T>(Widget Function(BuildContext context) builder) {
  return _runWithGlobalContext((context) => showDialog<T>(context: context, builder: builder));
}

// dynamic showGlobalToast(Toast toast) {
//   return _runWithGlobalContext((context) => Toaster.of(context).showToast(toast));
// }
