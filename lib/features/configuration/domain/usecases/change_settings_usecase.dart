import 'package:dartz/dartz.dart';
import 'package:pomodore/core/resources/params/settings_params.dart';
import 'package:pomodore/core/resources/usecase.dart';
import 'package:pomodore/features/configuration/domain/entities/settings_entity.dart';
import 'package:pomodore/features/configuration/domain/repositories/settings_repository.dart';

class ChangeSettingsUseCase
    extends UseCase<Either<String, SettingsEntity>, ChangeSettingsParams> {
  final SettingsRepository repository;

  ChangeSettingsUseCase(this.repository);

  @override
  Future<Either<String, SettingsEntity>> call(
      {ChangeSettingsParams? params}) async {
    return repository.changeSettings(params!);
  }
}
