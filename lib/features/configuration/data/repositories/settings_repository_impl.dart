import 'package:dartz/dartz.dart';
import 'package:pomodore/core/resources/params/settings_params.dart';
import 'package:pomodore/features/configuration/data/data_sources/settings_local_data_source.dart';
import 'package:pomodore/features/configuration/domain/entities/settings_entity.dart';
import 'package:pomodore/features/configuration/domain/repositories/settings_repository.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final SettingsLocalDataSources localDataSources;

  SettingsRepositoryImpl(this.localDataSources);

  @override
  Future<Either<String, SettingsEntity>> getSettings() async {
    late Either<String, SettingsEntity> result;

    try {
      SettingsEntity entity = await localDataSources.getAllSettings();
      result = Right(entity);
    } catch (e) {
      result = const Left("error");
    }

    return result;
  }

  @override
  Future<Either<String, SettingsEntity>> changeSettings(
      ChangeSettingsParams params) async {
    late Either<String, SettingsEntity> result;

    try {
      SettingsEntity entity = await localDataSources.changeSettings(params);
      result = Right(entity);
    } catch (e) {
      result = const Left("error");
    }

    return result;
  }

  @override
  Future<Either<String, String>> changeLocale(String langCode) async {
    late Either<String, String> result;

    try {
      String locale = await localDataSources.changeLocale(langCode);
      result = Right(locale);
    } catch (e) {
      result = const Left("error");
    }

    return result;
  }

  @override
  Future<Either<String, String>> getLocale() async {
    late Either<String, String> result;

    try {
      String locale = await localDataSources.getLocale();
      result = Right(locale);
    } catch (e) {
      result = const Left("error");
    }

    return result;
  }
}
