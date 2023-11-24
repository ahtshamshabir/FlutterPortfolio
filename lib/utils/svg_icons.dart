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
}
