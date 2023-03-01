import 'package:dartz/dartz.dart';
import 'package:pomodore/features/task_management/data/data_sources/timer_local_data_source.dart';
import 'package:pomodore/features/task_management/data/models/task_model.dart';
import 'package:pomodore/features/task_management/domain/repositories/timer_repository.dart';

import '../../../../core/resources/params/timer_state_params.dart';
import '../../domain/entities/pomodoro_entity.dart';

class TimerRepositoryImpl extends TimerRepository {
  final TimerLocalDataSource timerLocalDataSource;

  TimerRepositoryImpl(this.timerLocalDataSource);

  @override
  Future<Either<String, bool>> savePomodoroInDb(PomodoroEntity item) async {
    late Either<String, bool> result;

    bool status = await timerLocalDataSource.saveAPomodoroOnDb(item);

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

    TimerStateRestoreParams? restoredState =
        await timerLocalDataSource.restoreTimerState();

    if (restoredState != null) {
      result = Right(
        TimerStateParams(
          duration: restoredState.duration,
          baseDuration: restoredState.baseDuration,
          task: TaskModel.fromQueryToTaskModel(restoredState.task),
          timerDone: restoredState.timerDone,
        ),
      );
    } else {
      result = const Left("error");
    }

    timerLocalDataSource.removeTimerState();

    return result;
  }

  @override
  Future<Either<String, int>> saveTimerState(TimerStateParams params) async {
    late Either<String, int> result;

    int? state = await timerLocalDataSource.saveTimerState(params);

    if (state != null) {
      result = Right(state);
    } else {
      result = const Left("error");
    }

    return result;
  }
}
