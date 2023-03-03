import 'package:dartz/dartz.dart';
import 'package:pomodore/core/resources/usecase.dart';
import 'package:pomodore/features/configuration/domain/repositories/settings_repository.dart';

class ChangeLocaleUseCase extends UseCase<Either<String, String>, String> {
  final SettingsRepository repository;

  ChangeLocaleUseCase(this.repository);

  @override
  Future<Either<String, String>> call({String? params}) {
    return repository.changeLocale(params!);
  }
}
