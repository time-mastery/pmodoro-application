import "dart:async";

// ignore: depend_on_referenced_packages
import "package:bloc/bloc.dart";
import "package:dartz/dartz.dart";
import "package:equatable/equatable.dart";
import "package:pomodore/core/resources/params/timer_state_params.dart";

import "../../../../../core/utils/ticker.dart";
import "../../../domain/entities/pomodoro_entity.dart";
import "../../../domain/entities/task_entity.dart";
import "../../../domain/usecases/add_pomodoro_to_db_usecase.dart";
import "../../../domain/usecases/restore_timer_state_usecase.dart";
import "../../../domain/usecases/save_timer_state_usecase.dart";

part "timer_event.dart";

part "timer_state.dart";

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  final Ticker _ticker;
  TaskEntity? taskItem;
  final SaveTimerStateUseCase saveTimerStateUseCase;
  final RestoreTimerStateUseCase restoreTimerStateUseCase;
  final AddPomodoroToDbUseCase addPomodoroToDbUseCase;

  TimerBloc({
    required Ticker ticker,
    required this.saveTimerStateUseCase,
    required this.restoreTimerStateUseCase,
    required this.addPomodoroToDbUseCase,
  })  : _ticker = ticker,
        super(TimerInitial(_duration)) {
    on<TimerStarted>(_onStarted);
    on<TimerPaused>(_onPaused);
    on<TimerReset>(_onReset);
    on<TimerResumed>(_onResumed);
    on<_TimerTicked>(_onTicked);
    on<SaveCurrentTimerStateDialogShowed>(_onSaveCurrentTimeStateDialogShowed);
    on<TimerTaskSelected>(_timerTaskSelected);
    on<TimerTaskDeSelected>(_timerTaskDeSelected);
    on<TimerDurationSet>(_timerDurationSet);
    on<TimerStateSaved>(_timerStateSaved);
    on<TimerStateRestored>(_timerStateRestored);
    on<CurrentPomodoroToDatabaseSaved>(_onCurrentPomodoroOnDatabaseSaved);
  }

  static int _duration = 60 * 25;

  static int get getDuration => _duration;

  static int get getDurationInMinutes => _duration ~/ 60;

  static void setDuration(int duration) {
    _duration = duration * 60;
  }

  void selectTask(TaskEntity? item) => taskItem = item;

  void finishTask() => taskItem = null;

  StreamSubscription<int>? _tickerSubscription;

  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }

  void _onCurrentPomodoroOnDatabaseSaved(
      CurrentPomodoroToDatabaseSaved event, Emitter emit) async {
    emit(SaveCurrentPomodoroLoading(state.duration));

    final Either<String, bool> result =
        await addPomodoroToDbUseCase.call(params: event.item);
    result.fold(
      (l) => emit(SaveCurrentPomodoroFailure(state.duration)),
      (r) => emit(SaveCurrentPomodoroSuccess(state.duration)),
    );
  }

  void _timerStateSaved(TimerStateSaved event, Emitter emit) async {
    emit(SaveTimerLoading(state.duration));

    final Either<String, int> result = await saveTimerStateUseCase.call(
      params: TimerStateParams(
        duration: state.duration,
        baseDuration: getDurationInMinutes,
        task: taskItem,
        timerDone: false,
      ),
    );

    result.fold(
      (l) => emit(
        SaveTimerFailure(state.duration),
      ),
      (r) => emit(
        SaveTimerSuccess(state.duration),
      ),
    );
  }

  void _timerStateRestored(TimerStateRestored event, Emitter emit) async {
    emit(RestoreTimerLoading(state.duration));

    final Either<String, TimerStateParams> result =
        await restoreTimerStateUseCase.call();

    result.fold(
      (l) => emit(
        RestoreTimerFailure(state.duration),
      ),
      (r) => emit(
        RestoreTimerSuccess(state.duration, r),
      ),
    );
  }

  void _timerDurationSet(TimerDurationSet event, Emitter emit) {
    emit(ChangeTimerDurationLoading(state.duration));
    setDuration(event.minute);
    emit(TimerInitial(_duration));
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
    emit(TimerInitial(_duration));
  }

  void _onTicked(_TimerTicked event, Emitter<TimerState> emit) {
    emit(
      event.duration > 0
          ? TimerInProgress(event.duration)
          : const TimerCompleted(),
    );
  }
}
