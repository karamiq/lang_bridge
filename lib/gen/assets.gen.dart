/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/thuluth.ttf
  String get thuluth => 'assets/fonts/thuluth.ttf';

  /// List of all assets
  List<String> get values => [thuluth];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/CameraPlus.svg
  SvgGenImage get cameraPlus => const SvgGenImage('assets/svg/CameraPlus.svg');

  /// File path: assets/svg/book.svg
  SvgGenImage get book => const SvgGenImage('assets/svg/book.svg');

  /// File path: assets/svg/calendar.svg
  SvgGenImage get calendar => const SvgGenImage('assets/svg/calendar.svg');

  /// File path: assets/svg/closed_book.svg
  SvgGenImage get closedBook => const SvgGenImage('assets/svg/closed_book.svg');

  /// File path: assets/svg/controller.svg
  SvgGenImage get controller => const SvgGenImage('assets/svg/controller.svg');

  /// File path: assets/svg/cup.svg
  SvgGenImage get cup => const SvgGenImage('assets/svg/cup.svg');

  /// File path: assets/svg/fire.svg
  SvgGenImage get fire => const SvgGenImage('assets/svg/fire.svg');

  /// File path: assets/svg/globe.svg
  SvgGenImage get globe => const SvgGenImage('assets/svg/globe.svg');

  /// File path: assets/svg/leaderboard.svg
  SvgGenImage get leaderboard =>
      const SvgGenImage('assets/svg/leaderboard.svg');

  /// File path: assets/svg/profile.svg
  SvgGenImage get profile => const SvgGenImage('assets/svg/profile.svg');

  /// File path: assets/svg/search-01.svg
  SvgGenImage get search01 => const SvgGenImage('assets/svg/search-01.svg');

  /// File path: assets/svg/star.svg
  SvgGenImage get star => const SvgGenImage('assets/svg/star.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
    cameraPlus,
    book,
    calendar,
    closedBook,
    controller,
    cup,
    fire,
    globe,
    leaderboard,
    profile,
    search01,
    star,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
}

class SvgGenImage {
  const SvgGenImage(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = false;

  const SvgGenImage.vec(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter:
          colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
