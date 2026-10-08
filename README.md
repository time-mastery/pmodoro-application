<div align="center">

<img src="https://raw.githubusercontent.com/mahmoud-eslami/resume/hide-contribute/pmodoro/app_icon.png" width="112" alt="Pmodoro icon">

# Pmodoro

**A focused-work timer, built around one tomato and five minutes of rest.**

[![Flutter](https://img.shields.io/badge/Flutter-02569B?style=flat-square&logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-0175C2?style=flat-square&logo=dart&logoColor=white)](https://dart.dev)
[![Version](https://img.shields.io/badge/version-1.3.0-E94B3C?style=flat-square)](pubspec.yaml)
[![License: MIT](https://img.shields.io/badge/license-MIT-E94B3C?style=flat-square)](LICENSE)
[![Platforms](https://img.shields.io/badge/platforms-Android%20%7C%20iOS%20%7C%20macOS%20%7C%20Web-333333?style=flat-square)](#)

</div>

---

Pmodoro applies the Pomodoro Technique — 25 minutes of work, 5 minutes off — to a single app that also
tracks the habits and tasks that work is usually *for*. No account required to start; sign in only
unlocks sync.

<div align="center">
<table>
<tr>
<td><img src="https://github.com/time-mastery/pmodoro-application/assets/57481226/34afcd40-80e6-43f3-b696-c71fed6e4a4e" width="140"></td>
<td><img src="https://github.com/time-mastery/pmodoro-application/assets/57481226/64bb95a2-3bf5-4201-bfec-6891815365ac" width="140"></td>
<td><img src="https://github.com/time-mastery/pmodoro-application/assets/57481226/81e5ea74-2e2f-43e5-aa1b-e3a0109e324e" width="140"></td>
<td><img src="https://github.com/time-mastery/pmodoro-application/assets/57481226/e6bd0447-5812-4ce0-8c3f-f0f65dd50df0" width="140"></td>
</tr>
<tr>
<td><img src="https://github.com/time-mastery/pmodoro-application/assets/57481226/434a6b9d-5daa-4893-bb23-bc4eec0708a0" width="140"></td>
<td><img src="https://github.com/time-mastery/pmodoro-application/assets/57481226/a1ff39ba-3369-4bb3-a796-a8c894c4e973" width="140"></td>
<td><img src="https://github.com/time-mastery/pmodoro-application/assets/57481226/9ddaf272-2a56-4011-a370-e8df01896dfe" width="140"></td>
<td><img src="https://github.com/time-mastery/pmodoro-application/assets/57481226/b564905c-595c-4094-b84b-bc1e6a150679" width="140"></td>
</tr>
</table>
</div>

## What's in it

| Module | What it does |
|---|---|
| **Timer** | Configurable work/break intervals, Rive-animated session state, sound + haptic cues at each transition |
| **Task management** | Attach tasks to sessions, track which ones actually got pomodoros spent on them |
| **Habit tracking** | Daily/weekly habits with a calendar heatmap of streaks |
| **Analytics** | Charts over completed sessions, focus time, and habit consistency |
| **Notifications** | Local reminders and session-end alerts, independent of app state |
| **Authentication** | Optional account for syncing configuration and history across devices |

## Under the hood

Each module in `lib/features/` is split into `data` / `domain` / `presentation` — Clean Architecture,
feature-first rather than layer-first:

```
lib/
├── core/            shared widgets, router, DI, services (db, notifications)
├── features/
│   ├── authentication/
│   ├── configuration/
│   ├── habit_tracking/
│   ├── notification_management/
│   └── task_management/
└── l10n/            en · de · fa
```

| Concern | Library |
|---|---|
| State management | `flutter_bloc`, `flutter_hooks` |
| Dependency injection | `get_it` |
| Persistence | `drift` (SQLite), `hive`, `flutter_secure_storage` |
| Charts | `syncfusion_flutter_charts`, `fl_chart`, `flutter_heatmap_calendar` |
| Notifications | `awesome_notifications` |
| Motion | `rive` |

## Running it

```bash
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs   # drift + localization codegen
flutter run
```

Tests:

```bash
flutter test
```

Android release builds are signed and shipped by `.github/workflows/release.yaml` on push to `main`.

## Contributing

Issues and pull requests are welcome — if you're proposing a feature rather than a fix, open an issue
first so the direction can be agreed on before the work is.

## License

MIT © [Pmodoro](https://github.com/time-mastery/pmodoro-application)
