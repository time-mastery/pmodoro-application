import 'package:equatable/equatable.dart';
import 'package:pomodore/features/task_management/domain/entities/task_entity.dart';

class TimerStateParams extends Equatable {
  final int duration;
  final int baseDuration;
  final TaskEntity? task;

  const TimerStateParams(
      {required this.duration, required this.baseDuration, required this.task});

  @override
  List<Object?> get props => [duration, baseDuration, task];
}

class TimerStateRestoreParams extends Equatable {
  final int duration;
  final int baseDuration;
  final Map<String, dynamic> task;

  const TimerStateRestoreParams(
      {required this.duration, required this.baseDuration, required this.task});

  @override
  List<Object?> get props => [duration, baseDuration, task];
}
