
void main() {
  // todo : check why blocTest not work
  // group("Timer Bloc", () {
  //   late TimerBloc timerBloc;
  //   int duration = 60 * 25;
  //
  //   setUp(() => timerBloc = TimerBloc(ticker: const Ticker()));
  //
  //   blocTest(
  //     "emit [TimerInProcess] when start timer",
  //     build: () => timerBloc,
  //     act: (bloc) => bloc.add(TimerStarted(duration)),
  //     expect: () => [TimerInProgress(duration)],
  //   );
  //
  //   blocTest(
  //     "emit [TimerInitial] when reset timer",
  //     build: () => timerBloc,
  //     act: (bloc) => bloc.add(TimerReset()),
  //     expect: () => [TimerInitial(duration)],
  //   );
  // });
}
