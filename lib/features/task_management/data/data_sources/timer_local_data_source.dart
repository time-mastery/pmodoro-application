import "package:pomodore/core/services/database/collections/task_collection.dart";
import "package:pomodore/core/services/database/isar_helper.dart";
import "package:pomodore/core/services/database/storage.dart";
import "package:pomodore/core/utils/debug_print.dart";
import "package:pomodore/features/task_management/data/models/task_model.dart";

import "../../../../core/resources/params/save_pomodoro_params.dart";
import "../../../../core/resources/params/timer_state_params.dart";

class TimerLocalDataSource {
  final IsarHelper db;

  TimerLocalDataSource(this.db);

  void removeTimerState() async {
    try {
      dPrint("delete old timer state");
      await FStorage.delete(FStorage.timerStateKey);
      await FStorage.delete(FStorage.timerStateDateTimeKey);
      await FStorage.delete(FStorage.timerStateBaseDurationKey);
      await FStorage.delete(FStorage.taskIdKey);
    } catch (e, s) {
      dPrint("$e   $s");
      rethrow;
    }
  }

  Future<bool> saveAPomodoroOnDb(SavePomodoroParams item) async {
    try {
      removeTimerState();

      if (item.shouldSave) {
        int? id = await db.saveAPomodoro(item);
        return (id != null);
      }
    } catch (e) {
      return false;
    }
    return true;
  }

  Future<int?> saveTimerState(TimerStateParams stateParams) async {
    int? result;
    try {
      await FStorage.write(
          FStorage.timerStateKey, stateParams.duration.toString());
      await FStorage.write(
          FStorage.timerStateDateTimeKey, DateTime.now().toString());
      await FStorage.write(FStorage.timerStateBaseDurationKey,
          stateParams.baseDuration.toString());
      if (stateParams.task != null) {
        await FStorage.write(FStorage.taskIdKey, stateParams.task!.uid);
      }
      result = stateParams.duration;
    } catch (e) {
      rethrow;
    }
    return result;
  }

  Future<TaskModel?> getTaskByUid(String? id) async {
    try {
      if (id == null) return null;
      TaskCollection? collection = await db.getTaskByUId(id);
      if (collection == null) return null;
      return TaskModel.collectionToModel(collection);
    } catch (e) {
      dPrint(e.toString());
      rethrow;
    }
  }

  Future<TimerStateRestoreParams?> restoreTimerState() async {
    try {
      final state = await FStorage.read(FStorage.timerStateKey);
      final dateTimeState = await FStorage.read(FStorage.timerStateDateTimeKey);
      final baseStateDuration =
          await FStorage.read(FStorage.timerStateBaseDurationKey);
      final id = await FStorage.read(FStorage.taskIdKey);

      final String? init = await FStorage.read(FStorage.initialized);

      if (init != "1") return null;

      if (state != null && dateTimeState != null && baseStateDuration != null) {
        final DateTime restoredDateTime = DateTime.parse(dateTimeState);
        final DateTime now = DateTime.now();
        final Duration remainDuration = now.difference(restoredDateTime);
        final TaskModel? task = await getTaskByUid(id);

        removeTimerState();

        if (remainDuration.inSeconds < int.parse(state)) {
          return TimerStateRestoreParams(
            duration: int.parse(state) - remainDuration.inSeconds,
            baseDuration: int.parse(baseStateDuration),
            task: task,
            timerDone: false,
          );
        } else {
          return TimerStateRestoreParams(
            duration: int.parse(state) - remainDuration.inSeconds,
            baseDuration: int.parse(baseStateDuration),
            task: task,
            timerDone: true,
          );
        }
      } else {
        dPrint("All values are null so we can not restore timer");
        return null;
      }
    } catch (e, s) {
      dPrint("$e   $s");
      return null;
    }
  }
}
