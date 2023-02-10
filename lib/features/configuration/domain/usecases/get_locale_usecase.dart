
import 'package:dartz/dartz.dart';
import 'package:pomodore/core/resources/usecase.dart';

import '../repositories/settings_repository.dart';

class GetLocaleUseCase extends UseCase<Either<String, String>, String> {
  final SettingsRepository repository;

  GetLocaleUseCase(this.repository);

  @override
  Future<Either<String, String>> call({String? params}) {
    return repository.getLocale();
  }
}
