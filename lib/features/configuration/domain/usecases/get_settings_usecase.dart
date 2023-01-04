import 'package:dartz/dartz.dart';
import 'package:pomodore/core/resources/usecase.dart';
import 'package:pomodore/features/configuration/domain/entities/settings_entity.dart';
import 'package:pomodore/features/configuration/domain/repositories/settings_repository.dart';

class GetSettingsUseCase
    extends UseCase<Either<String, SettingsEntity>, String> {
  final SettingsRepository settingsRepository;

  GetSettingsUseCase(this.settingsRepository);

  @override
  Future<Either<String, SettingsEntity>> call({String? params}) {
    return settingsRepository.getSettings();
  }
}
