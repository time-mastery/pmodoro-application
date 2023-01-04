import 'package:dartz/dartz.dart';
import 'package:pomodore/core/utils/storage.dart';
import 'package:pomodore/features/configuration/domain/entities/settings_entity.dart';
import 'package:pomodore/features/configuration/domain/repositories/settings_repository.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  @override
  Future<Either<String, SettingsEntity>> getSettings() async {
    late Either<String, SettingsEntity> result;

    try {
      bool notification = FStorage.read(FStorage.notificationKey);
      bool sound = FStorage.read(FStorage.notificationKey);
      bool vibration = FStorage.read(FStorage.notificationKey);
      bool appUpdates = FStorage.read(FStorage.notificationKey);
      bool newTip = FStorage.read(FStorage.notificationKey);
      bool showAds = FStorage.read(FStorage.notificationKey);
      result = Right(SettingsEntity(
        notification: notification,
        sound: sound,
        vibration: vibration,
        appUpdates: appUpdates,
        newTips: newTip,
        ads: showAds,
      ));
    } catch (e) {
      result = const Left("error");
    }

    return result;
  }
}
