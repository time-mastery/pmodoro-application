import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:pomodore/features/task_management/domain/entities/daily_information_entity.dart';
import 'package:pomodore/features/task_management/domain/usecases/get_today_tasks_usecase.dart';

import '../../../domain/entities/task_entity.dart';
import '../../../domain/usecases/get_daily_information_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetDailyInformationUseCase getDailyInformationUseCase;
  final GetTodayTasksUseCase getTodayTasksUseCase;

  HomeBloc({
    required this.getDailyInformationUseCase,
    required this.getTodayTasksUseCase,
  }) : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {});
    on<TodayTasksFetched>(_onFetchTodayTasks);
    on<DailyInformationFetched>(_onFetchDailyInformation);
    on<TaskTimerStarted>(_onStartTimerTask);
  }

  _onFetchTodayTasks(TodayTasksFetched event, Emitter emit) async {
    emit(FetchTodayTasksLoading());

    Either<String, List<TaskEntity>> result = await getTodayTasksUseCase.call(params: event.date);

    result.fold(
      (l) => emit(FetchTodayTasksFail()),
      (r) => emit(FetchTodayTasksSuccess(r)),
    );
  }

  _onFetchDailyInformation(DailyInformationFetched event, Emitter emit) async {
    emit(FetchDailyInformationLoading());

    Either<String, DailyInformationEntity> result = await getDailyInformationUseCase.call();

    result.fold(
      (l) => emit(FetchDailyInformationFail()),
      (r) => emit(FetchDailyInformationSuccess(r)),
    );
  }

  _onStartTimerTask(TaskTimerStarted event, Emitter emit) {}
}
