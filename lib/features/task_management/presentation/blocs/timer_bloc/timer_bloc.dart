import 'dart:async';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pomodore/features/task_management/presentation/widgets/task_item.dart';

import '../../../../../core/utils/ticker.dart';
import '../../../domain/entities/task_entity.dart';

part 'timer_event.dart';

part 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  final Ticker _ticker;
  TaskEntity? taskItem;

  TimerBloc({required Ticker ticker})
      : _ticker = ticker,
        super(const TimerInitial(_duration)) {
    on<TimerStarted>(_onStarted);
    on<TimerPaused>(_onPaused);
    on<TimerReset>(_onReset);
    on<TimerResumed>(_onResumed);
    on<_TimerTicked>(_onTicked);
    on<SaveCurrentTimerStateDialogShowed>(_onSaveCurrentTimeStateDialogShowed);
    on<TimerTaskSelected>(_timerTaskSelected);
    on<TimerTaskDeSelected>(_timerTaskDeSelected);
  }

  static const int _duration = 60 * 25;

  static get getDuration => _duration;

  void selectTask(TaskEntity? item) => taskItem = item;

  void finishTask() => taskItem = null;

  StreamSubscription<int>? _tickerSubscription;

  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }

  void _timerTaskSelected(TimerTaskSelected event, Emitter emit) {
    selectTask(event.taskItem);
    emit(SelectTaskSuccess(state.duration, taskItem!));
  }

  void _timerTaskDeSelected(TimerTaskDeSelected event, Emitter emit) {
    finishTask();
    emit(DeSelectTaskSuccess(state.duration));
  }

  void _onSaveCurrentTimeStateDialogShowed(
      SaveCurrentTimerStateDialogShowed event, Emitter<TimerState> emit) {
    emit(SaveCurrentTimeStateDialog(event.duration));
  }

  void _onStarted(TimerStarted event, Emitter<TimerState> emit) {
    emit(StartTimerLoading(event.duration));
    if (taskItem == null) {
      emit(StartTimerWithoutTaskFailure(event.duration));
    } else {
      emit(TimerInProgress(event.duration));
      _tickerSubscription?.cancel();
      _tickerSubscription = _ticker
          .tick(ticks: event.duration)
          .listen((duration) => add(_TimerTicked(duration)));
    }
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
