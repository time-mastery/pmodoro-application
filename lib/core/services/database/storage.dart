import "package:flutter_secure_storage/flutter_secure_storage.dart";

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

  // user info keys
  static const accessToken = "_access_token_";
  static const refreshToken = "_refresh_token_";
  static const uuid = "_uuid_";
  static const email = "_email_";

  static late FlutterSecureStorage flutterSecureStorage;

  static void initialize() async {
    flutterSecureStorage = const FlutterSecureStorage();

    final String? init = await read(initialized);
    if (init != "1") {
      write(initialized, "1");
      write(notificationKey, "1");
      write(soundKey, "1");
      write(vibrationKey, "1");
      write(appUpdateKey, "1");
      write(newTipKey, "1");
      write(showAdsKey, "0");
      write(localeKey, "en");
      write(themeKey, "light");
    }
  }

  static Future<void> write(String key, String value) async =>
      await flutterSecureStorage.write(key: key, value: value);

  static Future<void> delete(String key) async =>
      await flutterSecureStorage.delete(key: key);

  static Future<String?> read(String key) async =>
      await flutterSecureStorage.read(key: key);

  // User info methods
  static Future<void> writeAccessToken(String value) async =>
      await write(accessToken, value);

  static Future<void> writeRefreshToken(String value) async =>
      await write(refreshToken, value);

  static Future<void> writeUuid(String value) async => await write(uuid, value);

  static Future<void> writeEmail(String value) async =>
      await write(email, value);

  static Future<void> deleteAccessToken() async => await delete(accessToken);

  static Future<void> deleteRefreshToken() async => await delete(refreshToken);

  static Future<void> deleteUuid() async => await delete(uuid);

  static Future<void> deleteEmail() async => await delete(email);

  static Future<String?> readAccessToken() async => await read(accessToken);

  static Future<String?> readRefreshToken() async => await read(refreshToken);

  static Future<String?> readUuid() async => await read(uuid);

  static Future<String?> readEmail() async => await read(email);

  static Future<bool> checkUserAuthState() async {
    final String? accessTokenValue = await readAccessToken();
    final String? refreshTokenValue = await readRefreshToken();

    return accessTokenValue != null && refreshTokenValue != null;
  }
}
