import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class FStorage {
  static const notificationKey = "_notification_";
  static const soundKey = "_sound_";
  static const vibrationKey = "_vibration_";
  static const appUpdateKey = "_update_";
  static const newTipKey = "_tip_";
  static const showAdsKey = "_ads_";

  static late FlutterSecureStorage flutterSecureStorage;

  static initialize() {
    flutterSecureStorage = const FlutterSecureStorage();
  }

  static write(String key, dynamic value) async =>
      await flutterSecureStorage.write(key: key, value: value);

  static delete(String key) async =>
      await flutterSecureStorage.delete(key: key);

  static read(String key) async => await flutterSecureStorage.read(key: key);
}
