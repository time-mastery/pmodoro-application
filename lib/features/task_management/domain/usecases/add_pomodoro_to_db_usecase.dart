import "package:dartz/dartz.dart";
import "package:pomodore/core/resources/usecase.dart";
import "package:pomodore/features/task_management/domain/repositories/timer_repository.dart";

import "../../../../core/resources/params/save_pomodoro_params.dart";

class AddPomodoroToDbUseCase
    extends UseCase<Either<String, bool>, SavePomodoroParams> {
  final TimerRepository _timerRepository;

  AddPomodoroToDbUseCase(this._timerRepository);

  @override
  Future<Either<String, bool>> call({SavePomodoroParams? params}) {
    return _timerRepository.savePomodoroInDb(params!);
  }
}
