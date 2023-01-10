import 'package:pomodore/core/resources/params/settings_params.dart';
import 'package:pomodore/features/configuration/domain/entities/settings_entity.dart';

import '../../../../core/utils/storage.dart';
import '../../../../core/utils/utils.dart';

class SettingsLocalDataSources {
  Future<SettingsEntity> getAllSettings() async {
    try {
      String? notification = await FStorage.read(FStorage.notificationKey);
      String? sound = await FStorage.read(FStorage.soundKey);
      String? vibration = await FStorage.read(FStorage.vibrationKey);
      String? appUpdates = await FStorage.read(FStorage.appUpdateKey);
      String? newTip = await FStorage.read(FStorage.newTipKey);
      String? showAds = await FStorage.read(FStorage.showAdsKey);
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

  Future<SettingsEntity> changeSettings(ChangeSettingsParams params) async {
    try {
      await FStorage.write(params.key, params.value ? "1" : "0");
      return await getAllSettings();
    } catch (e) {
      rethrow;
    }
  }
}
