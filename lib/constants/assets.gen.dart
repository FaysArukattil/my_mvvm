// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/DMSansMedium.ttf
  String get dMSansMedium => 'assets/fonts/DMSansMedium.ttf';

  /// File path: assets/fonts/DMSansRegular.ttf
  String get dMSansRegular => 'assets/fonts/DMSansRegular.ttf';

  /// File path: assets/fonts/InterMedium.ttf
  String get interMedium => 'assets/fonts/InterMedium.ttf';

  /// File path: assets/fonts/InterRegular.ttf
  String get interRegular => 'assets/fonts/InterRegular.ttf';

  /// File path: assets/fonts/InterSemiBold.ttf
  String get interSemiBold => 'assets/fonts/InterSemiBold.ttf';

  /// File path: assets/fonts/PoppinsBold.ttf
  String get poppinsBold => 'assets/fonts/PoppinsBold.ttf';

  /// File path: assets/fonts/PoppinsMedium.ttf
  String get poppinsMedium => 'assets/fonts/PoppinsMedium.ttf';

  /// File path: assets/fonts/PoppinsRegular.ttf
  String get poppinsRegular => 'assets/fonts/PoppinsRegular.ttf';

  /// File path: assets/fonts/PoppinsSemiBold.ttf
  String get poppinsSemiBold => 'assets/fonts/PoppinsSemiBold.ttf';

  /// List of all assets
  List<String> get values => [
    dMSansMedium,
    dMSansRegular,
    interMedium,
    interRegular,
    interSemiBold,
    poppinsBold,
    poppinsMedium,
    poppinsRegular,
    poppinsSemiBold,
  ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/banner.png
  AssetGenImage get banner => const AssetGenImage('assets/images/banner.png');

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/rahul.jpeg
  AssetGenImage get rahul => const AssetGenImage('assets/images/rahul.jpeg');

  /// List of all assets
  List<AssetGenImage> get values => [banner, logo, rahul];
}

class Assets {
  const Assets._();

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

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
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
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

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
