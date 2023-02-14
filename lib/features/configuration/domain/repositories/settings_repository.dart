import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:pomodore/core/resources/params/settings_params.dart';
import 'package:pomodore/features/configuration/domain/entities/settings_entity.dart';
import 'package:pomodore/features/configuration/domain/entities/theme_entity.dart';

abstract class SettingsRepository {
  Future<Either<String, SettingsEntity>> getSettings();

  Future<Either<String, SettingsEntity>> changeSettings(
      ChangeSettingsParams params);

  Future<Either<String, String>> changeLocale(String langCode);

  Future<Either<String, String>> getLocale();

  Future<Either<String, ThemeData>> getTheme();

  Future<Either<String, ThemeData>?> changeTheme(ThemeEntity theme);
}
