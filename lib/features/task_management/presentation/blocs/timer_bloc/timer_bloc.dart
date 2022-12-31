import 'dart:async';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/utils/ticker.dart';

part 'timer_event.dart';

part 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  final Ticker _ticker;

  TimerBloc({required Ticker ticker})
      : _ticker = ticker,
        super(const TimerInitial(_duration)) {
    on<TimerStarted>(_onStarted);
    on<TimerPaused>(_onPaused);
    on<TimerReset>(_onReset);
    on<TimerResumed>(_onResumed);
    on<_TimerTicked>(_onTicked);
    on<SaveCurrentTimerStateDialogShowed>(_onSaveCurrentTimeStateDialogShowed);
  }

  static const int _duration = 60 * 25;

  static get getDuration => _duration;

  StreamSubscription<int>? _tickerSubscription;

  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }

  void _onSaveCurrentTimeStateDialogShowed(
      SaveCurrentTimerStateDialogShowed event, Emitter<TimerState> emit) {
    emit(SaveCurrentTimeStateDialog(event.duration));
  }

  void _onStarted(TimerStarted event, Emitter<TimerState> emit) {
    emit(TimerInProgress(event.duration));
    _tickerSubscription?.cancel();
    _tickerSubscription = _ticker
        .tick(ticks: event.duration)
        .listen((duration) => add(_TimerTicked(duration)));
  }

  void _onPaused(TimerPaused event, Emitter<TimerState> emit) {
    if (state is TimerInProgress) {
      _tickerSubscription?.pause();
      emit(TimerPause(state.duration));
    }
  }

  void _onResumed(TimerResumed resume, Emitter<TimerState> emit) {
    if (state is TimerPause) {
      _tickerSubscription?.resume();
      emit(TimerInProgress(state.duration));
    }
  }

  void _onReset(TimerReset event, Emitter<TimerState> emit) {
    _tickerSubscription?.cancel();
    emit(const TimerInitial(_duration));
  }

  void _onTicked(_TimerTicked event, Emitter<TimerState> emit) {
    emit(
      event.duration > 0
          ? TimerInProgress(event.duration)
          : const TimerCompleted(),
    );
  }
}
