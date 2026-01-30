import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Loads an SVG asset with a fallback when it fails (e.g. on web or embedded raster).
///
/// On web, uses [Image.network] with the asset URL so the browser renders the SVG.
/// This avoids flutter_svg's unreliable behavior on Flutter web (HTML renderer and
/// SVGs disappearing after paint).
/// On non-web platforms, uses [SvgPicture.string] with a cached load future.
class SvgAssetWithFallback extends StatefulWidget {
  const SvgAssetWithFallback({
    super.key,
    required this.assetPath,
    required this.fallback,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
  });

  final String assetPath;
  final Widget fallback;
  final double? width;
  final double? height;
  final BoxFit fit;

  @override
  State<SvgAssetWithFallback> createState() => _SvgAssetWithFallbackState();
}

class _SvgAssetWithFallbackState extends State<SvgAssetWithFallback> {
  late final Future<String> _svgFuture;

  @override
  void initState() {
    super.initState();
    _svgFuture = _loadSvgString(context, widget.assetPath);
  }

  @override
  Widget build(BuildContext context) {
    // On web, bypass flutter_svg: use Image.network so the browser renders the SVG.
    // flutter_svg has known issues on web (HTML renderer, SVGs disappearing after render).
    if (kIsWeb) {
      final url = Uri.base.resolve(widget.assetPath).toString();
      return Image.network(
        url,
        width: widget.width,
        height: widget.height,
        fit: widget.fit,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return widget.fallback;
        },
        errorBuilder: (_, __, ___) => widget.fallback,
      );
    }

    return FutureBuilder<String>(
      future: _svgFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData &&
            snapshot.data != null &&
            snapshot.data!.isNotEmpty) {
          try {
            return SvgPicture.string(
              snapshot.data!,
              width: widget.width,
              height: widget.height,
              fit: widget.fit,
            );
          } catch (_) {
            return widget.fallback;
          }
        }
        return widget.fallback;
      },
    );
  }

  static Future<String> _loadSvgString(
      BuildContext context, String assetPath) async {
    try {
      final data =
          await DefaultAssetBundle.of(context).load(assetPath);
      return String.fromCharCodes(data.buffer.asUint8List());
    } catch (_) {
      return '';
    }
  }
}
