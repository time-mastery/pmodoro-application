import "package:dartz/dartz.dart";
import "package:pomodore/features/task_management/domain/repositories/timer_repository.dart";

import "package:pomodore/core/resources/params/timer_state_params.dart";
import "package:pomodore/core/resources/usecase.dart";

class RestoreTimerStateUseCase extends UseCase<Either<String, TimerStateParams>, int> {
  final TimerRepository timerRepository;

  RestoreTimerStateUseCase(this.timerRepository);

  @override
  Future<Either<String, TimerStateParams>> call({int? params}) {
    return timerRepository.restoreTimerState();
  }
}
