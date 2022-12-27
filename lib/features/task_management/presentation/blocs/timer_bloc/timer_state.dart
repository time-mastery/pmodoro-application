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

  @override
  List<Object?> get props => [];
}

class SaveCurrentTimeStateDialog extends TimerState {
  const SaveCurrentTimeStateDialog(super.duration);

  @override
  String toString() {
    return 'SaveCurrentTimeStateDialog{}';
  }
}
