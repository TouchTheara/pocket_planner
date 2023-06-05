/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/NotoSans-Regular.ttf
  String get notoSansRegular => 'assets/fonts/NotoSans-Regular.ttf';

  /// List of all assets
  List<String> get values => [notoSansRegular];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/applelogo.png
  AssetGenImage get applelogo =>
      const AssetGenImage('assets/images/applelogo.png');

  /// File path: assets/images/fblogo.png
  AssetGenImage get fblogo => const AssetGenImage('assets/images/fblogo.png');

  /// File path: assets/images/googlelogo.png
  AssetGenImage get googlelogo =>
      const AssetGenImage('assets/images/googlelogo.png');

  /// File path: assets/images/new_splash.png
  AssetGenImage get newSplash =>
      const AssetGenImage('assets/images/new_splash.png');

  /// File path: assets/images/splash.png
  AssetGenImage get splash => const AssetGenImage('assets/images/splash.png');

  $AssetsImagesSvgFileGen get svgFile => const $AssetsImagesSvgFileGen();

  /// List of all assets
  List<AssetGenImage> get values =>
      [applelogo, fblogo, googlelogo, newSplash, splash];
}

class $AssetsLottieAnimationGen {
  const $AssetsLottieAnimationGen();

  /// File path: assets/lottie_animation/onboard.json
  String get onboard => 'assets/lottie_animation/onboard.json';

  /// List of all assets
  List<String> get values => [onboard];
}

class $AssetsImagesSvgFileGen {
  const $AssetsImagesSvgFileGen();

  /// File path: assets/images/svgFile/underDevelopment.svg
  String get underDevelopment => 'assets/images/svgFile/underDevelopment.svg';

  /// List of all assets
  List<String> get values => [underDevelopment];
}

class Assets {
  Assets._();

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLottieAnimationGen lottieAnimation =
      $AssetsLottieAnimationGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}
