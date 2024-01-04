import 'dart:ui' as ui;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_portfolio/utils/svg_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';

Future<Uint8List> svgToPng(String svgPath, BuildContext context, {int? width, int? height}) async {
  var svgString = await rootBundle.loadString(svgPath);
  final pictureInfo = await vg.loadPicture(SvgStringLoader(svgString), context);
  // print(svgString);
  String temp = svgString.substring(svgString.indexOf('height="') + 8);
  int svgHeight = height ?? int.parse(temp.substring(0, temp.indexOf('"')));
  temp = svgString.substring(svgString.indexOf('width="') + 7);
  int svgWidth = width ?? int.parse(temp.substring(0, temp.indexOf('"')));
  var devicePixelRatio = context.getInheritedWidgetOfExactType<MediaQuery>()!.data.devicePixelRatio;
  svgWidth = svgWidth * devicePixelRatio.toInt();
  svgHeight = svgHeight * devicePixelRatio.toInt();

  print('svgWidth: $svgWidth, svgHeight: $svgHeight');

  final image = await pictureInfo.picture.toImage(svgWidth, svgHeight);
  final byteData = await image.toByteData(format: ui.ImageByteFormat.png);

  if (byteData == null) {
    throw Exception('Unable to convert SVG to PNG');
  }

  final pngBytes = byteData.buffer.asUint8List();
  return pngBytes;
}

Future<Uint8List> svgStringToPngBytes(
  // The SVG string
  String svgPath, {
  double devicePixelRatio = 2,
  // The target width of the output image
  int? width,
  // The target height of the output image
  int? height,
}) async {
  var svgString = await rootBundle.loadString(svgPath);
  final SvgStringLoader svgStringLoader = SvgStringLoader(svgString);
  final PictureInfo pictureInfo = await vg.loadPicture(svgStringLoader, null);
  String temp = svgString.substring(svgString.indexOf('height="') + 8);
  int svgHeight = height ?? int.parse(temp.substring(0, temp.indexOf('"')));
  temp = svgString.substring(svgString.indexOf('width="') + 7);
  int svgWidth = width ?? int.parse(temp.substring(0, temp.indexOf('"')));
  svgWidth = svgWidth * devicePixelRatio.toInt();
  svgHeight = svgHeight * devicePixelRatio.toInt();
  final ui.Picture picture = pictureInfo.picture;
  final ui.PictureRecorder recorder = ui.PictureRecorder();
  final ui.Canvas canvas =
      Canvas(recorder, Rect.fromPoints(Offset.zero, Offset(svgWidth.toDouble(), svgHeight.toDouble())));
  canvas.scale(svgWidth / pictureInfo.size.width, svgHeight / pictureInfo.size.height);
  canvas.drawPicture(picture);
  final ui.Image imgByteData = await recorder.endRecording().toImage(svgWidth.ceil(), svgHeight.ceil());
  final ByteData? bytesData = await imgByteData.toByteData(format: ui.ImageByteFormat.png);
  final Uint8List imageData = bytesData?.buffer.asUint8List() ?? Uint8List(0);
  pictureInfo.picture.dispose();
  return imageData;
}
