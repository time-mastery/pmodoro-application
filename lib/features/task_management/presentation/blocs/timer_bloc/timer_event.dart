part of "timer_bloc.dart";

abstract class TimerEvent extends Equatable {
  const TimerEvent();
}

class TimerStarted extends TimerEvent {
  final int duration;

  const TimerStarted(this.duration);

  @override
  List<Object?> get props => [duration];
}

class TimerPaused extends TimerEvent {
  @override
  List<Object?> get props => [];
}

class TimerReset extends TimerEvent {
  @override
  List<Object?> get props => [];
}

class TimerResumed extends TimerEvent {
  @override
  List<Object?> get props => [];
}

class _TimerTicked extends TimerEvent {
  final int duration;

  const _TimerTicked(this.duration);

  @override
  List<Object?> get props => [duration];
}

class SaveCurrentTimerStateDialogShowed extends TimerEvent {
  final TaskEntity? taskItem;
  final int duration;

  const SaveCurrentTimerStateDialogShowed({
    required this.taskItem,
    required this.duration,
  });

  @override
  List<Object?> get props => [taskItem, duration];

  @override
  String toString() {
    return "SaveCurrentTimerStateDialogShowed{taskUid: $taskItem, duration: $duration}";
  }
}

class TimerTaskSelected extends TimerEvent {
  final TaskEntity? taskItem;

  const TimerTaskSelected(this.taskItem);

  @override
  List<Object?> get props => [taskItem];
}

class TimerTaskDeSelected extends TimerEvent {
  @override
  List<Object?> get props => [];
}

class TimerDurationSet extends TimerEvent {
  final int minute;

  const TimerDurationSet(this.minute);

  @override
  List<Object?> get props => [minute];

  @override
  String toString() {
    return "TimerDurationSet{minute: $minute}";
  }
}

class TimerStateSaved extends TimerEvent {
  const TimerStateSaved();

  @override
  List<Object?> get props => [];
}

class TimerStateRestored extends TimerEvent {
  const TimerStateRestored();

  @override
  List<Object?> get props => [];
}

class CurrentPomodoroToDatabaseSaved extends TimerEvent {
  final PomodoroEntity item;

  const CurrentPomodoroToDatabaseSaved(this.item);

  @override
  List<Object?> get props => [item];

  @override
  String toString() {
    return "CurrentPomodoroToDatabaseSaved{item: $item}";
  }
}
