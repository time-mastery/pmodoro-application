import "package:pomodore/features/configuration/domain/entities/settings_entity.dart";

class SettingsModel extends SettingsEntity {
  const SettingsModel(
    bool notification,
    bool sound,
    bool vibration,
    bool appUpdates,
    bool newTips,
    bool ads,
  ) : super(
          notification: notification,
          sound: sound,
          vibration: vibration,
          ads: ads,
          appUpdates: appUpdates,
          newTips: newTips,
        );

  static Map<String, bool> toJson(SettingsEntity model) => {
        "notification": model.notification,
        "sound": model.sound,
        "vibration": model.vibration,
        "ads": model.ads,
        "appUpdates": model.appUpdates,
        "newTips": model.newTips,
      };

  static SettingsEntity fromJson(Map<String, dynamic> item) => SettingsEntity(
        notification: item["notification"],
        sound: item["sound"],
        vibration: item["vibration"],
        appUpdates: item["appUpdates"],
        newTips: item["newTips"],
        ads: item["ads"],
      );
}
