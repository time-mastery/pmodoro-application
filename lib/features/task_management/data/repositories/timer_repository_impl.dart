import "package:dartz/dartz.dart";
import "package:pomodore/core/utils/debug_print.dart";
import "package:pomodore/features/task_management/data/data_sources/timer_local_data_source.dart";
import "package:pomodore/features/task_management/data/models/task_model.dart";
import "package:pomodore/features/task_management/domain/repositories/timer_repository.dart";

import "../../../../core/resources/params/save_pomodoro_params.dart";
import "../../../../core/resources/params/timer_state_params.dart";

class TimerRepositoryImpl extends TimerRepository {
  final TimerLocalDataSource timerLocalDataSource;

  TimerRepositoryImpl(this.timerLocalDataSource);

  @override
  Future<Either<String, bool>> savePomodoroInDb(SavePomodoroParams item) async {
    late Either<String, bool> result;

    final bool status = await timerLocalDataSource.saveAPomodoroOnDb(item);

    if (status) {
      result = Right(status);
    } else {
      result = const Left("error");
    }

    return result;
  }

  @override
  Future<Either<String, TimerStateParams>> restoreTimerState() async {
    late Either<String, TimerStateParams> result;

    try {
      final TimerStateRestoreParams? restoredState =
          await timerLocalDataSource.restoreTimerState();

      if (restoredState != null) {
        result = Right(
          TimerStateParams(
            duration: restoredState.duration,
            baseDuration: restoredState.baseDuration,
            task: restoredState.task != null
                ? TaskModel.fromJson(restoredState.task!)
                : null,
            timerDone: restoredState.timerDone,
          ),
        );
      } else {
        result = const Left("error");
      }
    } catch (e, s) {
      dPrint("$e   $s");
      result = const Left("error");
    }

    return result;
  }

  @override
  Future<Either<String, int>> saveTimerState(TimerStateParams params) async {
    late Either<String, int> result;

    final int? state = await timerLocalDataSource.saveTimerState(params);

    if (state != null) {
      result = Right(state);
    } else {
      result = const Left("error");
    }

    return result;
  }
}
