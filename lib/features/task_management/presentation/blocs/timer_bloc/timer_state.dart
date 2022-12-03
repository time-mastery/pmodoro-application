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
  List<Object> get props => [];
}

class TimerRunPause extends TimerState {
  const TimerRunPause(super.duration);

  @override
  List<Object?> get props => [];
}

class TimerRunInProgress extends TimerState {
  const TimerRunInProgress(super.duration);

  @override
  List<Object?> get props => [];
}

class TimerRunCompleted extends TimerState {
  const TimerRunCompleted() : super(0);

  @override
  List<Object?> get props => [];
}
