# FLOWORA 2.0 — Flutter Android wrapper

This repository currently hosts the FLOWORA PWA. The Flutter wrapper loads the published app at:
`https://geminimodel-git.github.io/FlowOra2.0/`

## Build locally
Install Flutter and Android SDK, then run from the repository root:

```bash
flutter pub get
flutter build apk --release --split-per-abi
```

APK outputs:
- `build/app/outputs/flutter-apk/app-armeabi-v7a-release.apk`
- `build/app/outputs/flutter-apk/app-arm64-v8a-release.apk`
- `build/app/outputs/flutter-apk/app-x86_64-release.apk` (emulator/other x64 devices)

For one universal APK, run `flutter build apk --release`.

The GitHub Actions workflow provisions the Android platform scaffolding, applies the Internet permission and hardware acceleration settings, and uploads APK artifacts. This wrapper requires an internet connection to load the hosted PWA; WebView localStorage persistence is provided by Android WebView. PWA external CDN assets also require network access.

## Important
This is a WebView-based Android app wrapper, not a fully native rewrite of every web screen. Period data stays in WebView storage unless the web app itself syncs it elsewhere. Cycle predictions are estimates and should not be used as contraception or a medical diagnosis.
