import "package:dartz/dartz.dart";
import "package:pomodore/core/resources/usecase.dart";

import "package:pomodore/core/resources/params/timer_state_params.dart";
import "package:pomodore/features/task_management/domain/repositories/timer_repository.dart";

class SaveTimerStateUseCase extends UseCase<Either<String, int>, TimerStateParams> {
  final TimerRepository timerRepository;

  SaveTimerStateUseCase(this.timerRepository);

  @override
  Future<Either<String, int>> call({TimerStateParams? params}) {
    return timerRepository.saveTimerState(params!);
  }
}
