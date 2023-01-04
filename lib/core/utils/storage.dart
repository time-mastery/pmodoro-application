import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Storage {
  static late FlutterSecureStorage flutterSecureStorage;

  static initialize() {
    flutterSecureStorage = FlutterSecureStorage();
  }
}
