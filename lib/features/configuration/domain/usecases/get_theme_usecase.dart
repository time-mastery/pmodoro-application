import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:pomodore/core/resources/usecase.dart';

import '../repositories/settings_repository.dart';

class GetThemeUseCase extends UseCase<Either<String, ThemeData>, String?> {

  final SettingsRepository settingsRepository;

  GetThemeUseCase(this.settingsRepository);

  @override
  Future<Either<String, ThemeData>> call({String? params}) {
    return settingsRepository.getTheme();
  }
}
