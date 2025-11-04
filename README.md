<p align="center">

# 🧠✨ Dart & Flutter Quiz

Interactive quiz app to test your Dart and Flutter knowledge with a clean, modern UI.

[![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?logo=dart&logoColor=white)](https://dart.dev)
[![Platforms](https://img.shields.io/badge/Platforms-Android%20%7C%20iOS%20%7C%20Web%20%7C%20Windows%20%7C%20macOS%20%7C%20Linux-informational)](#)
[![License](https://img.shields.io/badge/License-Free%20to%20use-brightgreen)](#license)

</p>

---

## Overview 📚

This app lets users pick a difficulty and take a multiple‑choice quiz about Dart and Flutter. It features an animated splash screen, polished theming, progress indicator, and a results view with performance feedback.

## Features ✨

- 🎬 Animated splash screen and smooth page transitions
- 🎚️ Difficulty selection: **Easy (10 Qs)** or **Hard (20 Qs)**
- 🎯 Curated question bank with randomization per session
- 🎨 Clean Material 3‑style theme with custom color scheme
- 📈 Progress bar, live score, and responsive layout
- 🏁 Result screen with percentage, badges, and actionable CTAs
- 🧩 Runs on Android, iOS, Web, Windows, macOS, and Linux

## Tech Stack 🧰

- **Flutter** (Material)
- **Dart 3**

## Project Structure 🗂️

```
lib/
  main.dart                  # App entry, routes, theme
  models/
    question.dart            # Question model + generator
  screens/
    splash_screen.dart       # Animated splash → difficulty
    difficulty_screen.dart   # Choose Easy/Hard
    quiz_screen.dart         # Quiz flow + progress
    result_screen.dart       # Results + feedback
  widgets/
    question_card.dart       # Question UI + options
```

## Getting Started 🚀

### Prerequisites

- Flutter SDK installed and on PATH
- Dart SDK (bundled with Flutter)

Verify your environment:

```bash
flutter --version
flutter doctor
```

### Install Dependencies 📦

```bash
flutter pub get
```

### Run (by platform) ▶️

```bash
# Android (device/emulator)
flutter run -d android

# iOS (simulator; on macOS with Xcode)
flutter run -d ios

# Web
flutter run -d chrome

# Windows / macOS / Linux (desktop)
flutter run -d windows   # or macos / linux
```

### Build Release 🏗️

```bash
# Android APK/AAB
flutter build apk        # or: flutter build appbundle

# iOS (archive with Xcode after)
flutter build ios

# Web
flutter build web

# Desktop
flutter build windows    # or macos / linux
```

## Configuration ⚙️

- App name and version: edit `pubspec.yaml` (`name`, `description`, `version`).
- Theming: adjust `ThemeData` in `lib/main.dart`.
- Question set: edit or extend the list in `lib/models/question.dart`.

## Testing 🧪

```bash
flutter test
```


## Roadmap 🗺️

- More categories (state management, widgets, async, tooling)
- Timed mode and streaks
- Persisted high scores
- Localization (i18n)

## License 🪪
This project is open-source and free to use.



---

Made with Flutter 💙
