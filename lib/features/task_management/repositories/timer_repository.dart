import "dart:developer";

import "package:dartz/dartz.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:pomodore/core/resources/params/save_pomodoro_params.dart";
import "package:pomodore/core/resources/params/timer_state_params.dart";
import "package:pomodore/core/utils/debug_print.dart";
import "package:pomodore/features/task_management/data_sources/timer_local_data_source.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

part "timer_repository.g.dart";

@riverpod
TimerRepository timerRepository(Ref ref) {
  return TimerRepositoryImpl(ref.read(timerLocalDataSourceProvider));
}

abstract class TimerRepository {
  Future<int> saveTimerState(TimerStateParams state);

  Future<TimerStateParams> restoreTimerState();

  Future<bool> savePomodoroInDb(SavePomodoroParams item);
}

class TimerRepositoryImpl extends TimerRepository {
  final TimerLocalDataSource timerLocalDataSource;

  TimerRepositoryImpl(this.timerLocalDataSource);

  @override
  Future<bool> savePomodoroInDb(SavePomodoroParams item) async {
    try {
      final bool status = await timerLocalDataSource.saveAPomodoroOnDb(item);
      return status;
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      rethrow;
    }
  }

  @override
  Future<TimerStateParams> restoreTimerState() async {
    try {
      final TimerStateRestoreParams? restoredState =
          await timerLocalDataSource.restoreTimerState();

      if (restoredState != null) {
        return TimerStateParams(
          duration: restoredState.duration,
          baseDuration: restoredState.baseDuration,
          task: restoredState.task,
          timerDone: restoredState.timerDone,
        );
      } else {
        throw Exception("Error restoring timer state");
      }
    } catch (e, s) {
      dPrint("$e   $s");
      rethrow;
    }
  }

  @override
  Future<int> saveTimerState(TimerStateParams params) async {
    try {
      final int? state = await timerLocalDataSource.saveTimerState(params);
      if (state != null) {
        return state;
      } else {
        throw Exception("Error saving timer state");
      }
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      rethrow;
    }
  }
}
