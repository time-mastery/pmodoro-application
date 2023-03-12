import "package:pomodore/core/resources/params/settings_params.dart";
import "package:pomodore/features/configuration/domain/entities/settings_entity.dart";

import "../../../../core/services/database/storage.dart";
import "../../../../core/utils/utils.dart";

class SettingsLocalDataSources {
  Future<SettingsEntity> getAllSettings() async {
    try {
      final String? notification = await FStorage.read(FStorage.notificationKey);
      final String? sound = await FStorage.read(FStorage.soundKey);
      final String? vibration = await FStorage.read(FStorage.vibrationKey);
      final String? appUpdates = await FStorage.read(FStorage.appUpdateKey);
      final String? newTip = await FStorage.read(FStorage.newTipKey);
      final String? showAds = await FStorage.read(FStorage.showAdsKey);
      return SettingsEntity(
        notification: Utils.convertStringFromStorageToBool(notification ?? "1"),
        sound: Utils.convertStringFromStorageToBool(sound ?? "1"),
        vibration: Utils.convertStringFromStorageToBool(vibration ?? "1"),
        appUpdates: Utils.convertStringFromStorageToBool(appUpdates ?? "1"),
        newTips: Utils.convertStringFromStorageToBool(newTip ?? "1"),
        ads: Utils.convertStringFromStorageToBool(showAds ?? "0"),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<String> getLocale() async {
    final String? locale = await FStorage.read(FStorage.localeKey);
    return locale ?? "en";
  }

  Future<String> changeLocale(String langCode) async {
     await FStorage.write(FStorage.localeKey, langCode);
    return langCode;
  }

  Future<String> getTheme() async {
    return await FStorage.read(FStorage.themeKey) ?? "light";
  }

  Future changeTheme(String title) async {
    await FStorage.write(FStorage.themeKey, title);
    return title;
  }

  Future<SettingsEntity> changeSettings(ChangeSettingsParams params) async {
    try {
      await FStorage.write(params.key, params.value ? "1" : "0");
      return await getAllSettings();
    } catch (e) {
      rethrow;
    }
  }
}
