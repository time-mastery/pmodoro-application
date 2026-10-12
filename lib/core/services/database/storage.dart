import "dart:io";

import "package:flutter_secure_storage/flutter_secure_storage.dart";
import "package:hive_flutter/hive_flutter.dart";

class FStorage {
  static const notificationKey = "_notification_";
  static const soundKey = "_sound_";
  static const vibrationKey = "_vibration_";
  static const appUpdateKey = "_update_";
  static const newTipKey = "_tip_";
  static const showAdsKey = "_ads_";
  static const initialized = "_init_";
  static const localeKey = "_locale_";
  static const themeKey = "_theme_";
  static const welcomeNotificationKey = "_welcomeKey_";
  static const timerStateKey = "_tState_";
  static const timerStateBaseDurationKey = "_tStateBaseDuration_";
  static const timerStateDateTimeKey = "_tdtState_";
  static const taskIdKey = "_taskId_";

  static late FlutterSecureStorage flutterSecureStorage;

  /// On macOS the keychain ties item access to the app's code signature.
  /// Local builds are ad-hoc signed, so every rebuild gets a new signature
  /// and macOS asks for the login password again. Nothing stored here is
  /// secret (settings and timer state), so macOS uses a plain Hive box.
  static Box<String>? _macBox;

  static Future<void> initialize() async {
    if (Platform.isMacOS) {
      await Hive.initFlutter();
      _macBox = await Hive.openBox<String>("settings");
    } else {
      flutterSecureStorage = const FlutterSecureStorage();
    }

    final String? init = await read(initialized);
    if (init != "1") {
      await Future.wait([
        write(initialized, "1"),
        write(notificationKey, "1"),
        write(soundKey, "1"),
        write(vibrationKey, "1"),
        write(appUpdateKey, "1"),
        write(newTipKey, "1"),
        write(showAdsKey, "0"),
        write(localeKey, "en"),
        write(themeKey, "light"),
      ]);
    }
  }

  static Future<void> write(String key, String value) async {
    final box = _macBox;
    if (box != null) return box.put(key, value);
    await flutterSecureStorage.write(key: key, value: value);
  }

  static Future<void> delete(String key) async {
    final box = _macBox;
    if (box != null) return box.delete(key);
    await flutterSecureStorage.delete(key: key);
  }

  static Future<String?> read(String key) async {
    final box = _macBox;
    if (box != null) return box.get(key);
    return flutterSecureStorage.read(key: key);
  }
}
