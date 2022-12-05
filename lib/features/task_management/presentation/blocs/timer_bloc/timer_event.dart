part of 'timer_bloc.dart';

abstract class TimerEvent extends Equatable {
  const TimerEvent();
}

class StartTimer extends TimerEvent {
  final int duration;

  const StartTimer(this.duration);

  @override
  List<Object?> get props => [duration];
}

class PauseTimer extends TimerEvent {
  @override
  List<Object?> get props => [];
}

class ResetTimer extends TimerEvent {
  @override
  List<Object?> get props => [];
}

class ResumeTimer extends TimerEvent {
  @override
  List<Object?> get props => [];
}

class _TickTimer extends TimerEvent {
  final int duration;

  const _TickTimer(this.duration);

  @override
  List<Object?> get props => [duration];
}
