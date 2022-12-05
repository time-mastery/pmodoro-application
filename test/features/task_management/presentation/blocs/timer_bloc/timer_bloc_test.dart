import 'package:bloc_test/bloc_test.dart';
import 'package:pomodore/core/utils/ticker.dart';
import 'package:pomodore/features/task_management/presentation/blocs/timer_bloc/timer_bloc.dart';
import 'package:test/test.dart';

void main() {
  group("Timer Bloc", () {
    late TimerBloc timerBloc;
    int duration = 60;

    setUp(() => timerBloc = TimerBloc(ticker: const Ticker()));

    blocTest(
      "emit [TimerInProcess] when start timer",
      build: () => timerBloc,
      act: (bloc) => bloc.add(TimerStarted(duration)),
      expect: () => [TimerInProgress(duration)],
    );
  });
}
