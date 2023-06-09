import "package:dartz/dartz.dart";
import "package:pomodore/core/resources/params/save_pomodoro_params.dart";
import "package:pomodore/core/resources/params/timer_state_params.dart";

abstract class TimerRepository {
  Future<Either<String, int>> saveTimerState(TimerStateParams state);

  Future<Either<String, TimerStateParams>> restoreTimerState();

  Future<Either<String, bool>> savePomodoroInDb(SavePomodoroParams item);
}
