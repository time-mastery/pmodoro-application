part of 'timer_bloc.dart';

abstract class TimerEvent extends Equatable {
  const TimerEvent();
}

class StartTimer extends TimerEvent {
  @override
  List<Object?> get props => [];
}

class ResetTimer extends TimerEvent {
  @override
  List<Object?> get props => [];
}

class StopTimer extends TimerEvent {
  @override
  List<Object?> get props => [];
}
