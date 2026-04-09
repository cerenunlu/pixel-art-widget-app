# Pixel Ambient Widgets

A production-minded iOS-first MVP architecture for calm pixel-art animated widgets.

## Repository structure

- `App/` SwiftUI application layer (library, detail, settings placeholder)
- `WidgetExtension/` WidgetKit timeline + rendering
- `Shared/` Shared models, scene definitions, persistence, and timeline utilities
- `Assets/Scenes/lonely_night_water/` Required scene frame names and asset checklist
- `Tests/PixelAmbientWidgetsSharedTests/` Shared logic tests

## Manual Xcode setup required

This repository focuses on code-first structure and shared logic. To run as an iOS app and widget extension:

1. Create an iOS App target named `Pixel Ambient Widgets` and set source roots to `App/` and `Shared/`.
2. Create a Widget Extension target and set source roots to `WidgetExtension/` and `Shared/`.
3. Set **App Group** capability for both targets:
   - `group.com.example.pixelambientwidgets`
4. Add matching image assets to both app and widget asset catalogs:
   - `lonely_night_water_preview`
   - `frame_01`, `frame_05`, `frame_09`, `frame_13`, `frame_17`
5. Ensure both targets can import the shared module (`PixelAmbientWidgetsShared`) via SPM package or target membership.

## Animation strategy

Widget animation uses timeline-driven frame swapping (not GIF playback):

`frame_01 -> frame_05 -> frame_09 -> frame_13 -> frame_17 -> frame_09 -> frame_05`

Frame duration defaults to `1.8` seconds for a subtle ambient motion.

## Local validation

Shared logic is validated with Swift Package Manager:

```bash
swift test
```
