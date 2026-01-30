# Flutter Web: SVG briefly shows then disappears

## Why it happens

1. **Rendering backend**  
   In Flutter 3.24+, the HTML renderer was removed. Web builds now use **CanvasKit (Skia)** by default, so SVG support is generally good. If you’re on an older Flutter and see flicker, upgrade Flutter.

2. **Asset path / bundling**  
   Wrong path in `pubspec.yaml` or the file not being included in `build/web/assets` can cause the asset to fail after first paint.

3. **Unsupported SVG features**  
   `flutter_svg` doesn’t support everything (e.g. some gradients, masks, nested refs). Complex SVGs may render partially or not at all.

## Fixes

### 1. Use a recent Flutter (CanvasKit is default)

**Run (development):**
```bash
flutter run -d chrome
```

**Build (production):**
```bash
flutter build web
```

Newer Flutter no longer has `--web-renderer`; the default is CanvasKit. In VS Code, use **“Flutter (Chrome)”**.

### 2. Asset declaration

SVGs are declared in `pubspec.yaml`:

```yaml
flutter:
  assets:
    - assets/
    - assets/images/
    - assets/images/logo.svg
    - assets/images/hero_cmyk.svg
```

After changing assets:
```bash
flutter clean
flutter pub get
```
Then do a **full restart** (not hot reload).

### 3. Loading SVGs in code

Use `SvgPicture.asset` (or this project’s `SvgAssetWithFallback` in `lib/utills/asset_loader.dart` for a fallback when the SVG fails):

```dart
SvgPicture.asset(
  'assets/images/logo.svg',
  width: 100,
  height: 100,
);
```

### 4. Simplify the SVG if needed

If an SVG still doesn’t render or disappears:

- Remove or simplify gradients, masks, and complex refs.
- Use a tool like [SVGOMG](https://jakearchibald.github.io/svgomg/) to clean the file.
- Export with “Outline strokes” and fewer advanced features.

### 5. Check the browser console

In DevTools look for:

- 404s for assets (path/bundling).
- Errors from the `flutter_svg` parser (unsupported features).

## Quick checklist

| Situation | Likely fix |
|-----------|------------|
| SVG appears then disappears | Upgrade Flutter (CanvasKit is default); check asset path |
| Works locally, fails after deploy | Fix asset path and ensure files are in `build/web/assets` |
| Blank or partial SVG | Simplify SVG or avoid unsupported features |
| Some SVGs work, others don’t | Rendering/parser limits in `flutter_svg`; simplify SVG |
