# How the SVG fix works (assets + web)

Quick reference: where things live and how the “SVG shows then disappears” issue is fixed in this project.

---

## 1. Assets (where SVGs live)

| What | Path |
|------|------|
| Logo SVG | `assets/images/logo.svg` |
| Hero CMYK graphic | `assets/images/hero_cmyk.svg` |

Declared in **`pubspec.yaml`** so they are bundled for web:

```yaml
flutter:
  assets:
    - assets/
    - assets/images/
    - assets/images/logo.svg
    - assets/images/hero_cmyk.svg
```

After adding or changing assets: `flutter clean` → `flutter pub get` → **full restart** (no hot reload).

---

## 2. Web (how they’re used)

- **Build output:** `flutter build web` puts assets under `build/web/assets/...`.
- **No extra config in `web/`:** `web/index.html` does not reference SVGs; Flutter serves them via the app bundle.
- **Renderer:** Recent Flutter uses CanvasKit by default for web (no `--web-renderer` flag). That gives better SVG support.

---

## 3. How the SVG “message” is fixed in code

**Problem:** On web, SVGs can load briefly then disappear (e.g. asset path, embedded raster, or renderer).

**Fix in this project:** Load SVG as **string from the asset bundle** and render with `SvgPicture.string`, with a **fallback** if load/parse fails.

| File | Role |
|------|------|
| **`lib/utills/asset_loader.dart`** | `SvgAssetWithFallback` – loads `assetPath` via `DefaultAssetBundle`, then `SvgPicture.string(...)`. On failure or empty data, shows `fallback` widget. |
| **`lib/modules/home/views/widgets/navbar.dart`** | Logo: `SvgAssetWithFallback(assetPath: 'assets/images/logo.svg', fallback: _LogoPlaceholder())`. |
| **`lib/modules/home/views/widgets/hero_section.dart`** | Hero graphic: `SvgAssetWithFallback(assetPath: 'assets/images/hero_cmyk.svg', fallback: _CmykPlaceholder())`. |

So:

1. **Assets** – SVGs in `assets/images/` and listed in `pubspec.yaml`.
2. **Web** – Same assets, bundled by `flutter build web`; no SVG-specific setup in `web/`.
3. **Message fixed** – Use `SvgAssetWithFallback` so if the SVG fails (path, format, or web loading), the user always sees the fallback (logo text or CMYK bars) instead of a blank or error.

---

## 4. More detail

- Full troubleshooting (why it happens, checklist): **[docs/WEB_SVG.md](WEB_SVG.md)**.
- README: **[README.md](../README.md)** (section “Web: SVG assets”).
