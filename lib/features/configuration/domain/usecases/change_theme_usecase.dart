import "package:dartz/dartz.dart";
import "package:flutter/material.dart";
import "package:pomodore/features/configuration/domain/repositories/settings_repository.dart";

import "../../../../core/resources/params/theme_params.dart";
import "../../../../core/resources/usecase.dart";

class ChangeThemeUseCase
    extends UseCase<Either<String, ThemeData>?, ThemeParams?> {
  final SettingsRepository settingsRepository;

  ChangeThemeUseCase(this.settingsRepository);

  @override
  Future<Either<String, ThemeData>?> call({ThemeParams? params}) {
    return settingsRepository.changeTheme(params!);
  }
}
