import 'package:equatable/equatable.dart';

class TimerStateParams extends Equatable {
  final int duration;
  final int baseDuration;

  const TimerStateParams(this.duration, this.baseDuration);

  @override
  List<Object?> get props => [duration, baseDuration];
}
