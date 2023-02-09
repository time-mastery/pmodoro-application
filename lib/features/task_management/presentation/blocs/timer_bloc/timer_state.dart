part of 'timer_bloc.dart';

abstract class TimerState extends Equatable {
  const TimerState(this.duration);

  final int duration;

  @override
  List<Object?> get props => [duration];
}

class TimerInitial extends TimerState {
  const TimerInitial(super.duration);

  @override
  List<Object> get props => [duration];
}

class TimerPause extends TimerState {
  const TimerPause(super.duration);

  @override
  List<Object?> get props => [duration];
}

class TimerInProgress extends TimerState {
  const TimerInProgress(super.duration);

  @override
  List<Object?> get props => [duration];
}

class TimerCompleted extends TimerState {
  const TimerCompleted() : super(0);
}

class SaveCurrentTimeStateDialog extends TimerState {
  const SaveCurrentTimeStateDialog(super.duration);
}

class StartTimerWithoutTaskFailure extends TimerState {
  const StartTimerWithoutTaskFailure(super.duration);

  @override
  List<Object?> get props => [duration];
}

class StartTimerLoading extends TimerState {
  const StartTimerLoading(super.duration);

  @override
  List<Object?> get props => [duration];
}

class SelectTaskSuccess extends TimerState {

  final TaskEntity taskItem;

  const SelectTaskSuccess(super.duration, this.taskItem);


  @override
  List<Object?> get props => [duration, taskItem];
}
