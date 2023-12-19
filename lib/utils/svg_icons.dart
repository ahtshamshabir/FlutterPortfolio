import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jovial_svg/jovial_svg.dart';

ScalableImageCache _svgCache = ScalableImageCache(size: 70);


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
    var allScalables = [
      ScalableImageSource.fromSvg(
        rootBundle,
        'assets/icons/linkedin.svg',
      ),
      ScalableImageSource.fromSvg(
        rootBundle,
        'assets/icons/github.svg',
      ),
      ScalableImageSource.fromSvg(
        rootBundle,
        'assets/icons/youtube.svg',
      ),
      ScalableImageSource.fromSvg(
        rootBundle,
        'assets/icons/instagram.svg',
      ),
      ScalableImageSource.fromSvg(
        rootBundle,
        'assets/icons/flutter.svg',
      ),
      ScalableImageSource.fromSvg(
        rootBundle,
        'assets/icons/blender.svg',
      ),
      ScalableImageSource.fromSvg(
        rootBundle,
        'assets/icons/figma.svg',
      ),
      ScalableImageSource.fromSvg(
        rootBundle,
        'assets/icons/firebase.svg',
      ),
      ScalableImageSource.fromSvg(
        rootBundle,
        'assets/icons/google_cloud.svg',
      ),
      ScalableImageSource.fromSvg(
        rootBundle,
        'assets/icons/graphql.svg',
      ),
      ScalableImageSource.fromSvg(
        rootBundle,
        'assets/icons/illustrator.svg',
      ),
      ScalableImageSource.fromSvg(
        rootBundle,
        'assets/icons/javascript.svg',
      ),
      ScalableImageSource.fromSvg(
        rootBundle,
        'assets/icons/mongodb.svg',
      ),
      ScalableImageSource.fromSvg(
        rootBundle,
        'assets/icons/mysql.svg',
      ),
      ScalableImageSource.fromSvg(
        rootBundle,
        'assets/icons/neo4j.svg',
      ),
      ScalableImageSource.fromSvg(
        rootBundle,
        'assets/icons/nodejs.svg',
      ),
      ScalableImageSource.fromSvg(
        rootBundle,
        'assets/icons/photoshop.svg',
      ),
      ScalableImageSource.fromSvg(
        rootBundle,
        'assets/icons/php.svg',
      ),
      ScalableImageSource.fromSvg(
        rootBundle,
        'assets/icons/react.svg',
      ),
      ScalableImageSource.fromSvg(
        rootBundle,
        'assets/icons/strapi.svg',
      ),
      ScalableImageSource.fromSvg(
        rootBundle,
        'assets/icons/typescript.svg',
      ),
      ScalableImageSource.fromSvg(
        rootBundle,
        'assets/icons/vue.svg',
      ),
    ];
    linkedin = ScalableImageWidget.fromSISource(si: allScalables[0], cache: _svgCache);
    github = ScalableImageWidget.fromSISource(si: allScalables[1], cache: _svgCache);
    youtube = ScalableImageWidget.fromSISource(si: allScalables[2], cache: _svgCache);
    instagram = ScalableImageWidget.fromSISource(si: allScalables[3], cache: _svgCache);
    flutter = ScalableImageWidget.fromSISource(si: allScalables[4], cache: _svgCache);
    blender = ScalableImageWidget.fromSISource(si: allScalables[5], cache: _svgCache);
    figma = ScalableImageWidget.fromSISource(si: allScalables[6], cache: _svgCache);
    firebase = ScalableImageWidget.fromSISource(si: allScalables[7], cache: _svgCache);
    google_cloud = ScalableImageWidget.fromSISource(si: allScalables[8], cache: _svgCache);
    graphql = ScalableImageWidget.fromSISource(si: allScalables[9], cache: _svgCache);
    illustrator = ScalableImageWidget.fromSISource(si: allScalables[10], cache: _svgCache);
    javascript = ScalableImageWidget.fromSISource(si: allScalables[11], cache: _svgCache);
    mongodb = ScalableImageWidget.fromSISource(si: allScalables[12], cache: _svgCache);
    mysql = ScalableImageWidget.fromSISource(si: allScalables[13], cache: _svgCache);
    neo4j = ScalableImageWidget.fromSISource(si: allScalables[14], cache: _svgCache);
    nodejs = ScalableImageWidget.fromSISource(si: allScalables[15], cache: _svgCache);
    photoshop = ScalableImageWidget.fromSISource(si: allScalables[16], cache: _svgCache);
    php = ScalableImageWidget.fromSISource(si: allScalables[17], cache: _svgCache);
    react = ScalableImageWidget.fromSISource(si: allScalables[18], cache: _svgCache);
    strapi = ScalableImageWidget.fromSISource(si: allScalables[19], cache: _svgCache);
    typescript = ScalableImageWidget.fromSISource(si: allScalables[20], cache: _svgCache);
    vue = ScalableImageWidget.fromSISource(si: allScalables[21], cache: _svgCache);
  }
}
