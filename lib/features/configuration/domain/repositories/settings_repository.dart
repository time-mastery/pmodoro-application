import 'package:dartz/dartz.dart';
import 'package:pomodore/core/resources/params/settings_params.dart';
import 'package:pomodore/features/configuration/domain/entities/settings_entity.dart';

abstract class SettingsRepository {
  Future<Either<String, SettingsEntity>> getSettings();

  Future<Either<String, SettingsEntity>> changeSettings(
      ChangeSettingsParams params);

  Future<Either<String, String>> changeLocale(String langCode);

  Future<Either<String, String>> getLocale();
}
