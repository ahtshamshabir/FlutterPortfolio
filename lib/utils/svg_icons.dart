import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

extension CopyWith on SvgPicture {
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
