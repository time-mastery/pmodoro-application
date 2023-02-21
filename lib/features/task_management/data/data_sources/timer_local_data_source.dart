import 'package:pomodore/core/services/database/storage.dart';

import '../../../../core/resources/params/timer_state_params.dart';

class TimerLocalDataSource {
  Future<int?> saveTimerState(TimerStateParams stateParams) async {
    int? result;
    try {
      await FStorage.write(FStorage.timerStateKey, stateParams.duration);
      await FStorage.write(FStorage.timerStateDateTimeKey, DateTime.now());
      await FStorage.write(
          FStorage.timerStateBaseDurationKey, stateParams.baseDuration);
      result = stateParams.duration;
    } catch (e) {
      rethrow;
    }
    return result;
  }

  Future<TimerStateParams?> restoreTimerState() async {
    TimerStateParams? result;
    try {
      var state = await FStorage.read(FStorage.timerStateKey);
      var dateTimeState = await FStorage.read(FStorage.timerStateDateTimeKey);
      var baseStateDuration =
          await FStorage.read(FStorage.timerStateBaseDurationKey);

      if (state != null && dateTimeState != null && baseStateDuration != null) {
        DateTime restoredDateTime = DateTime.parse(dateTimeState);
        DateTime now = DateTime.now();
        Duration remainDuration = now.difference(restoredDateTime);

        if (remainDuration.inSeconds < int.parse(state)) {
          result = TimerStateParams(int.parse(state) - remainDuration.inSeconds,
              int.parse(baseStateDuration));
        } else {
          result = const TimerStateParams(0, 25);
        }
      }
    } catch (e) {
      rethrow;
    }
    return result;
  }
}
