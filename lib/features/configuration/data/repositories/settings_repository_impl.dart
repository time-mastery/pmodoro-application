import 'package:dartz/dartz.dart';
import 'package:pomodore/core/utils/storage.dart';
import 'package:pomodore/features/configuration/domain/entities/settings_entity.dart';
import 'package:pomodore/features/configuration/domain/repositories/settings_repository.dart';

import '../../../../core/utils/utils.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  @override
  Future<Either<String, SettingsEntity>> getSettings() async {
    late Either<String, SettingsEntity> result;

    try {
      String? notification = await FStorage.read(FStorage.notificationKey);
      String? sound = await FStorage.read(FStorage.notificationKey);
      String? vibration = await FStorage.read(FStorage.notificationKey);
      String? appUpdates = await FStorage.read(FStorage.notificationKey);
      String? newTip = await FStorage.read(FStorage.notificationKey);
      String? showAds = await FStorage.read(FStorage.notificationKey);
      result = Right(SettingsEntity(
        notification: Utils.convertStringFromStorageToBool(notification ?? "1"),
        sound: Utils.convertStringFromStorageToBool(sound ?? "1"),
        vibration: Utils.convertStringFromStorageToBool(vibration ?? "1"),
        appUpdates: Utils.convertStringFromStorageToBool(appUpdates ?? "1"),
        newTips: Utils.convertStringFromStorageToBool(newTip ?? "1"),
        ads: Utils.convertStringFromStorageToBool(showAds ?? "0"),
      ));
    } catch (e, s) {
      result = const Left("error");
    }

    return result;
  }

  @override
  Future<Either<String, bool>> changeSettings(
      String settingKey, bool value) async {
    late Either<String, bool> result;

    try {
      bool? changeState = FStorage.write(settingKey, value);
      if (changeState != null && changeState) {
        result = Right(changeState);
      } else {
        result = const Left("error");
      }
    } catch (e) {
      result = const Left("error");
    }

    return result;
  }
}
