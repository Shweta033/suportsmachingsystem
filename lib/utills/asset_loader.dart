import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Loads an SVG asset with a fallback when it fails (e.g. on web or embedded raster).
class SvgAssetWithFallback extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _loadSvgString(context),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data != null && snapshot.data!.isNotEmpty) {
          try {
            return SvgPicture.string(
              snapshot.data!,
              width: width,
              height: height,
              fit: fit,
            );
          } catch (_) {
            return fallback;
          }
        }
        return fallback;
      },
    );
  }

  Future<String> _loadSvgString(BuildContext context) async {
    try {
      final data = await DefaultAssetBundle.of(context).load(assetPath);
      return String.fromCharCodes(data.buffer.asUint8List());
    } catch (_) {
      return '';
    }
  }
}
