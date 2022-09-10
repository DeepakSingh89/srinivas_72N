/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/banner.png
  AssetGenImage get banner => const AssetGenImage('assets/images/banner.png');

  /// File path: assets/images/cart.png
  AssetGenImage get cart => const AssetGenImage('assets/images/cart.png');

  /// File path: assets/images/default_image.png
  AssetGenImage get defaultImage =>
      const AssetGenImage('assets/images/default_image.png');

  /// File path: assets/images/down.png
  AssetGenImage get down => const AssetGenImage('assets/images/down.png');

  /// File path: assets/images/empty-cart.json
  String get emptyCart => 'assets/images/empty-cart.json';

  /// File path: assets/images/exchange.png
  AssetGenImage get exchange =>
      const AssetGenImage('assets/images/exchange.png');

  /// File path: assets/images/facebook.png
  AssetGenImage get facebook =>
      const AssetGenImage('assets/images/facebook.png');

  /// File path: assets/images/fast-delivery.png
  AssetGenImage get fastDelivery =>
      const AssetGenImage('assets/images/fast-delivery.png');

  /// File path: assets/images/google.png
  AssetGenImage get google => const AssetGenImage('assets/images/google.png');

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/logo2.png
  AssetGenImage get logo2 => const AssetGenImage('assets/images/logo2.png');

  /// File path: assets/images/menu.png
  AssetGenImage get menu => const AssetGenImage('assets/images/menu.png');

  /// File path: assets/images/mic.png
  AssetGenImage get mic => const AssetGenImage('assets/images/mic.png');

  /// File path: assets/images/otp.png
  AssetGenImage get otp => const AssetGenImage('assets/images/otp.png');

  /// File path: assets/images/product.png
  AssetGenImage get product => const AssetGenImage('assets/images/product.png');

  /// File path: assets/images/qrscan.png
  AssetGenImage get qrscan => const AssetGenImage('assets/images/qrscan.png');

  /// File path: assets/images/refer.png
  AssetGenImage get refer => const AssetGenImage('assets/images/refer.png');

  /// File path: assets/images/search.png
  AssetGenImage get search => const AssetGenImage('assets/images/search.png');

  /// File path: assets/images/tax.png
  AssetGenImage get tax => const AssetGenImage('assets/images/tax.png');

  /// File path: assets/images/up.png
  AssetGenImage get up => const AssetGenImage('assets/images/up.png');
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
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

  String get path => _assetName;

  String get keyName => _assetName;
}
