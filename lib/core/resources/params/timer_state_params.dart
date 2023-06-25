import "package:equatable/equatable.dart";
import "package:pomodore/features/task_management/domain/entities/task_entity.dart";

class TimerStateParams extends Equatable {
  final int duration;
  final int baseDuration;
  final TaskEntity? task;
  final bool timerDone;

  const TimerStateParams({
    required this.duration,
    required this.baseDuration,
    required this.task,
    required this.timerDone,
  });

  @override
  List<Object?> get props => [
        duration,
        baseDuration,
        task,
        timerDone,
      ];

  @override
  String toString() {
    return "TimerStateParams{duration: $duration, baseDuration: $baseDuration, task: $task, timerDone: $timerDone}";
  }
}

class TimerStateRestoreParams extends Equatable {
  final int duration;
  final int baseDuration;
  final TaskEntity? task;
  final bool timerDone;

  const TimerStateRestoreParams({
    required this.duration,
    required this.baseDuration,
    required this.task,
    required this.timerDone,
  });

  @override
  List<Object?> get props => [
        duration,
        baseDuration,
        task,
        timerDone,
      ];
}
