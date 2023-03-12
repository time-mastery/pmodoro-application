import "dart:convert";
import "dart:io";

import "package:flutter_test/flutter_test.dart";
import "package:pomodore/features/configuration/data/models/settings_model.dart";
import "package:pomodore/features/configuration/domain/entities/settings_entity.dart";

void main() {
  group("Settings model", () {
    test("Test settings model from json", () {
      final file =
          File("test/test_resources/random_settings.json").readAsStringSync();
      final Map<String, dynamic> json = Map<String, dynamic>.from(jsonDecode(file));
      final SettingsEntity settings = SettingsModel.fromJson(json);

      expect(settings.notification, json["notification"]);
      expect(settings.sound, json["sound"]);
      expect(settings.vibration, json["vibration"]);
      expect(settings.ads, json["ads"]);
      expect(settings.appUpdates, json["appUpdates"]);
      expect(settings.newTips, json["newTips"]);
    });
    test("Test settings model to json", () {
      final file =
          File("test/test_resources/random_settings.json").readAsStringSync();
      final Map<String, dynamic> json = Map<String, dynamic>.from(jsonDecode(file));
      final SettingsEntity settings = SettingsModel.fromJson(json);
      final Map<String, dynamic> temp = SettingsModel.toJson(settings);

      expect(temp["notification"], json["notification"]);
      expect(temp["sound"], json["sound"]);
      expect(temp["vibration"], json["vibration"]);
      expect(temp["ads"], json["ads"]);
      expect(temp["appUpdates"], json["appUpdates"]);
      expect(temp["newTips"], json["newTips"]);
    });
  });
}
