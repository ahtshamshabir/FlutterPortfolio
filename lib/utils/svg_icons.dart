import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jovial_svg/jovial_svg.dart';

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

  static late ScalableImageWidget linkedin,
      github,
      youtube,
      instagram,
      flutter,
      blender,
      figma,
      firebase,
      google_cloud,
      graphql,
      illustrator,
      javascript,
      mongodb,
      mysql,
      neo4j,
      nodejs,
      photoshop,
      php,
      react,
      strapi,
      typescript,
      vue;

  static Future<void> init() async {
    var allScalables = await Future.wait([
      ScalableImage.fromSvgAsset(
        rootBundle,
        'assets/icons/linkedin.svg',
      ),
      ScalableImage.fromSvgAsset(
        rootBundle,
        'assets/icons/github.svg',
      ),
      ScalableImage.fromSvgAsset(
        rootBundle,
        'assets/icons/youtube.svg',
      ),
      ScalableImage.fromSvgAsset(
        rootBundle,
        'assets/icons/instagram.svg',
      ),
      ScalableImage.fromSvgAsset(
        rootBundle,
        'assets/icons/flutter.svg',
      ),
      ScalableImage.fromSvgAsset(
        rootBundle,
        'assets/icons/blender.svg',
      ),
      ScalableImage.fromSvgAsset(
        rootBundle,
        'assets/icons/figma.svg',
      ),
      ScalableImage.fromSvgAsset(
        rootBundle,
        'assets/icons/firebase.svg',
      ),
      ScalableImage.fromSvgAsset(
        rootBundle,
        'assets/icons/google_cloud.svg',
      ),
      ScalableImage.fromSvgAsset(
        rootBundle,
        'assets/icons/graphql.svg',
      ),
      ScalableImage.fromSvgAsset(
        rootBundle,
        'assets/icons/illustrator.svg',
      ),
      ScalableImage.fromSvgAsset(
        rootBundle,
        'assets/icons/javascript.svg',
      ),
      ScalableImage.fromSvgAsset(
        rootBundle,
        'assets/icons/mongodb.svg',
      ),
      ScalableImage.fromSvgAsset(
        rootBundle,
        'assets/icons/mysql.svg',
      ),
      ScalableImage.fromSvgAsset(
        rootBundle,
        'assets/icons/neo4j.svg',
      ),
      ScalableImage.fromSvgAsset(
        rootBundle,
        'assets/icons/nodejs.svg',
      ),
      ScalableImage.fromSvgAsset(
        rootBundle,
        'assets/icons/photoshop.svg',
      ),
      ScalableImage.fromSvgAsset(
        rootBundle,
        'assets/icons/php.svg',
      ),
      ScalableImage.fromSvgAsset(
        rootBundle,
        'assets/icons/react.svg',
      ),
      ScalableImage.fromSvgAsset(
        rootBundle,
        'assets/icons/strapi.svg',
      ),
      ScalableImage.fromSvgAsset(
        rootBundle,
        'assets/icons/typescript.svg',
      ),
      ScalableImage.fromSvgAsset(
        rootBundle,
        'assets/icons/vue.svg',
      ),
    ]);
    linkedin = ScalableImageWidget(si: allScalables[0]);
    github = ScalableImageWidget(si: allScalables[1]);
    youtube = ScalableImageWidget(si: allScalables[2]);
    instagram = ScalableImageWidget(si: allScalables[3]);
    flutter = ScalableImageWidget(si: allScalables[4]);
    blender = ScalableImageWidget(si: allScalables[5]);
    figma = ScalableImageWidget(si: allScalables[6]);
    firebase = ScalableImageWidget(si: allScalables[7]);
    google_cloud = ScalableImageWidget(si: allScalables[8]);
    graphql = ScalableImageWidget(si: allScalables[9]);
    illustrator = ScalableImageWidget(si: allScalables[10]);
    javascript = ScalableImageWidget(si: allScalables[11]);
    mongodb = ScalableImageWidget(si: allScalables[12]);
    mysql = ScalableImageWidget(si: allScalables[13]);
    neo4j = ScalableImageWidget(si: allScalables[14]);
    nodejs = ScalableImageWidget(si: allScalables[15]);
    photoshop = ScalableImageWidget(si: allScalables[16]);
    php = ScalableImageWidget(si: allScalables[17]);
    react = ScalableImageWidget(si: allScalables[18]);
    strapi = ScalableImageWidget(si: allScalables[19]);
    typescript = ScalableImageWidget(si: allScalables[20]);
    vue = ScalableImageWidget(si: allScalables[21]);
  }
}
