import 'package:pomodore/core/services/database/storage.dart';
import 'package:pomodore/features/task_management/domain/entities/task_entity.dart';
import 'package:sqflite/sqflite.dart';

import '../../../../core/resources/params/timer_state_params.dart';
import '../../../../core/services/database/database_helper.dart';
import '../../domain/entities/pomodoro_entity.dart';
import '../models/pomodoro_model.dart';

class TimerLocalDataSource {
  final Database db;

  TimerLocalDataSource(this.db);

  void removeTimerState() async {
    await FStorage.delete(FStorage.timerStateKey);
    await FStorage.delete(FStorage.timerStateDateTimeKey);
    await FStorage.delete(FStorage.timerStateBaseDurationKey);
    await FStorage.delete(FStorage.taskIdKey);
  }

  Future<bool> saveAPomodoroOnDb(PomodoroEntity item) async {
    try {
      Map<String, Object?> data = PomodoroModel.toDbQuery(item);
      await db.insert(DatabaseHelper.pomodoroTable, data);
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
      await FStorage.write(FStorage.taskIdKey, stateParams.task.id);
      result = stateParams.duration;
    } catch (e) {
      rethrow;
    }
    return result;
  }

  Future<Map<String, dynamic>> getTaskById(String id) async {
    List<Map<String, dynamic>> result = await db.query(
      'tasks',
      where: 'uid = ?',
      whereArgs: [id],
    );
    return result.first;
  }

  Future<TimerStateRestoreParams?> restoreTimerState() async {
    TimerStateRestoreParams? result;
    try {
      var state = await FStorage.read(FStorage.timerStateKey);
      var dateTimeState = await FStorage.read(FStorage.timerStateDateTimeKey);
      var baseStateDuration =
          await FStorage.read(FStorage.timerStateBaseDurationKey);
      String? id = await FStorage.read(FStorage.taskIdKey);

      if (state != null &&
          dateTimeState != null &&
          baseStateDuration != null &&
          id != null) {
        DateTime restoredDateTime = DateTime.parse(dateTimeState);
        DateTime now = DateTime.now();
        Duration remainDuration = now.difference(restoredDateTime);
        Map<String, dynamic> task = await getTaskById(id);

        if (remainDuration.inSeconds < int.parse(state)) {
          result = TimerStateRestoreParams(
            duration: int.parse(state) - remainDuration.inSeconds,
            baseDuration: int.parse(baseStateDuration),
            task: task,
            timerDone: false,
          );
        } else {
          result = TimerStateRestoreParams(
            duration: int.parse(state) - remainDuration.inSeconds,
            baseDuration: int.parse(baseStateDuration),
            task: task,
            timerDone: true,
          );
        }
      } else {
        result = null;
      }
    } catch (e) {
      rethrow;
    }
    return result;
  }
}
