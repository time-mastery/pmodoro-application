part of 'timer_bloc.dart';

abstract class TimerState extends Equatable {
  const TimerState();
}

class TimerInitial extends TimerState {
  @override
  List<Object> get props => [];
}

class TimerReady extends TimerState {
  @override
  List<Object?> get props => [];
}

class TimerPaused extends TimerState {
  @override
  List<Object?> get props => [];
}

class TimerRunning extends TimerState {
  @override
  List<Object?> get props => [];
}

class TimerFinished extends TimerState {
  @override
  List<Object?> get props => [];
}
