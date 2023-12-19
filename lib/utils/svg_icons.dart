import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_portfolio/utils/svg_to_png.dart';
import 'package:flutter_svg/flutter_svg.dart';

extension CopyWith on SvgPicture {
  Image? toPng() {
    return getPngFromCache(this);
  }
  SvgPicture copyWith({
    BytesLoader? bytesLoader,
    Key? key,
    String? semanticsLabel,
    bool? excludeFromSemantics,
    double? width,
    double? height,
    BoxFit? fit,
    AlignmentGeometry? alignment,
    ImageRepeat? repeat,
    Rect? centerSlice,
    bool? matchTextDirection,
    bool? allowDrawingOutsideViewBox,
    ColorFilter? colorFilter,
    String? package,
    bool? useOldImageProvider,
    Color? color,
    BlendMode? colorBlendMode,
    FilterQuality? filterQuality,
    Clip? clipBehavior,
    bool? cacheColorFilter,
    SvgTheme? theme,
    WidgetBuilder? placeholderBuilder,
  }) {
    return SvgPicture(
      bytesLoader ?? this.bytesLoader,
      key: key ?? this.key,
      semanticsLabel: semanticsLabel ?? this.semanticsLabel,
      excludeFromSemantics: excludeFromSemantics ?? this.excludeFromSemantics,
      width: width ?? this.width,
      height: height ?? this.height,
      fit: fit ?? this.fit,
      alignment: alignment ?? this.alignment,
      matchTextDirection: matchTextDirection ?? this.matchTextDirection,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox ?? this.allowDrawingOutsideViewBox,
      colorFilter:
          color != null ? ColorFilter.mode(color, colorBlendMode ?? BlendMode.srcIn) : colorFilter ?? this.colorFilter,
      placeholderBuilder: placeholderBuilder ?? this.placeholderBuilder,
      clipBehavior: clipBehavior ?? this.clipBehavior,
    );
  }
}

class SvgIcons {
  SvgIcons._();

  static SvgPicture linkedin = SvgPicture.asset('assets/icons/linkedin.svg');
  static SvgPicture github = SvgPicture.asset('assets/icons/github.svg');
  static SvgPicture youtube = SvgPicture.asset('assets/icons/youtube.svg');
  static SvgPicture instagram = SvgPicture.asset('assets/icons/instagram.svg');

  static SvgPicture flutter = SvgPicture.asset('assets/icons/flutter.svg');
  static SvgPicture blender = SvgPicture.asset('assets/icons/blender.svg');
  static SvgPicture figma = SvgPicture.asset('assets/icons/figma.svg');
  static SvgPicture firebase = SvgPicture.asset('assets/icons/firebase.svg');
  static SvgPicture google_cloud = SvgPicture.asset('assets/icons/google_cloud.svg');
  static SvgPicture graphql = SvgPicture.asset('assets/icons/graphql.svg');
  static SvgPicture illustrator = SvgPicture.asset('assets/icons/illustrator.svg');
  static SvgPicture javascript = SvgPicture.asset('assets/icons/javascript.svg');
  static SvgPicture mongodb = SvgPicture.asset('assets/icons/mongodb.svg');
  static SvgPicture mysql = SvgPicture.asset('assets/icons/mysql.svg');
  static SvgPicture neo4j = SvgPicture.asset('assets/icons/neo4j.svg');
  static SvgPicture nodejs = SvgPicture.asset('assets/icons/nodejs.svg');
  static SvgPicture photoshop = SvgPicture.asset('assets/icons/photoshop.svg');
  static SvgPicture php = SvgPicture.asset('assets/icons/php.svg');
  static SvgPicture react = SvgPicture.asset('assets/icons/react.svg');
  static SvgPicture strapi = SvgPicture.asset('assets/icons/strapi.svg');
  static SvgPicture typescript = SvgPicture.asset('assets/icons/typescript.svg');
  static SvgPicture vue = SvgPicture.asset('assets/icons/vue.svg');
}

var svgStringsMap = <SvgPicture, String> {
  SvgIcons.blender: 'assets/icons/blender.svg',
  SvgIcons.firebase: 'assets/icons/firebase.svg',
  SvgIcons.figma: 'assets/icons/figma.svg',
  SvgIcons.flutter: 'assets/icons/flutter.svg',
  SvgIcons.github: 'assets/icons/github.svg',
  SvgIcons.google_cloud: 'assets/icons/google_cloud.svg',
  SvgIcons.graphql: 'assets/icons/graphql.svg',
  SvgIcons.illustrator: 'assets/icons/illustrator.svg',
  SvgIcons.instagram: 'assets/icons/instagram.svg',
  SvgIcons.javascript: 'assets/icons/javascript.svg',
  SvgIcons.linkedin: 'assets/icons/linkedin.svg',
  SvgIcons.mongodb: 'assets/icons/mongodb.svg',
  SvgIcons.mysql: 'assets/icons/mysql.svg',
  SvgIcons.neo4j: 'assets/icons/neo4j.svg',
  SvgIcons.nodejs: 'assets/icons/nodejs.svg',
  SvgIcons.photoshop: 'assets/icons/photoshop.svg',
  SvgIcons.php: 'assets/icons/php.svg',
  SvgIcons.react: 'assets/icons/react.svg',
  SvgIcons.strapi: 'assets/icons/strapi.svg',
  SvgIcons.typescript: 'assets/icons/typescript.svg',
  SvgIcons.vue: 'assets/icons/vue.svg',
  SvgIcons.youtube: 'assets/icons/youtube.svg',
};

var pngsMap = <String, Uint8List> {};

Future cachePngs() async {
  for (var entry in svgStringsMap.entries) {
    var pngBytes = await svgStringToPngBytes(entry.value);
    pngsMap[entry.value] = pngBytes;
  }
}

Image? getPngFromCache(SvgPicture svgPicture) {
  var svgString = svgStringsMap[svgPicture];
  if (svgString == null) {
    return null;
  }
  var pngBytes = pngsMap[svgString];
  if (pngBytes == null) {
    return null;
  }
  return Image.memory(pngBytes);
}
