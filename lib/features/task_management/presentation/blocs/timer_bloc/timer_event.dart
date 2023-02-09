part of 'timer_bloc.dart';

abstract class TimerEvent extends Equatable {
  const TimerEvent();
}

class TimerStarted extends TimerEvent {
  final int duration;
  final String? taskId;

  const TimerStarted(this.duration, this.taskId);

  @override
  List<Object?> get props => [duration, taskId];
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
  final String taskUid;
  final int duration;

  const SaveCurrentTimerStateDialogShowed({
    required this.taskUid,
    required this.duration,
  });

  @override
  List<Object?> get props => [taskUid, duration];

  @override
  String toString() {
    return 'SaveCurrentTimerStateDialogShowed{taskUid: $taskUid, duration: $duration}';
  }
}
