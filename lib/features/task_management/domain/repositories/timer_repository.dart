import 'package:dartz/dartz.dart';
import 'package:pomodore/core/resources/params/timer_state_params.dart';

abstract class TimerRepository {
  Future<Either<String, int>> saveTimerState(TimerStateParams state);

  Future<Either<String, TimerStateParams>> restoreTimerState();
}
