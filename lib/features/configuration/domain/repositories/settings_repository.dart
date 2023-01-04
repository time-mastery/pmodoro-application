import 'package:dartz/dartz.dart';
import 'package:pomodore/features/configuration/domain/entities/settings_entity.dart';

abstract class SettingsRepository {
  Future<Either<String, SettingsEntity>> getSettings();
}
