import "package:bloc/bloc.dart";
import "package:dartz/dartz.dart";
import "package:equatable/equatable.dart";
import "package:pomodore/features/task_management/domain/entities/daily_information_entity.dart";
import "package:pomodore/features/task_management/domain/usecases/get_uncompleted_tasks_usecase.dart";

import "../../../domain/entities/task_entity.dart";
import "../../../domain/usecases/check_daily_goal_usecase.dart";
import "../../../domain/usecases/get_daily_information_usecase.dart";
import "../../../domain/usecases/save_daily_goal_usecase.dart";

part "home_event.dart";
part "home_state.dart";

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetDailyInformationUseCase getDailyInformationUseCase;
  final GetUnCompletedTasksUseCase getUnCompletedUseCase;
  final CheckDailyGoalUseCase checkDailyGoalUseCase;
  final SaveDailyGoalUseCase saveDailyGoalUseCase;

  HomeBloc({
    required this.getDailyInformationUseCase,
    required this.getUnCompletedUseCase,
    required this.checkDailyGoalUseCase,
    required this.saveDailyGoalUseCase,
  }) : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {});
    on<HomeDataFetched>(_onFetchHomeData);
    on<DailyGoalChecked>(_dailyGoalChecked);
    on<DailyGoalSaved>(_dailyGoalSaved);
    on<DailyGoalUpdated>(_dailyGoalUpdated);
  }

  _dailyGoalUpdated(DailyGoalUpdated event, Emitter emit) async {
    emit(UpdateDailyGoalLoading());
    int value = event.value;
    if (value < 1) {
      value = 1;
    }
    emit(UpdateDailyGoalSuccess(value));
  }

  _dailyGoalSaved(DailyGoalSaved event, Emitter emit) async {
    emit(SaveDailyGoalLoading());
    final Either<String, bool> result =
        await saveDailyGoalUseCase.call(params: event.count);

    result.fold(
      (l) => emit(SaveDailyGoalFailure()),
      (r) => emit(SaveDailyGoalSuccess()),
    );
  }

  _dailyGoalChecked(DailyGoalChecked event, Emitter emit) async {
    emit(CheckDailyGoalLoading());
    final Either<String, bool> result = await checkDailyGoalUseCase.call();

    result.fold(
      (l) => emit(CheckDailyGoalFailure()),
      (r) => emit(CheckDailyGoalSuccess(r)),
    );
  }

  _onFetchHomeData(HomeDataFetched event, Emitter emit) async {
    emit(FetchHomeDataLoading());

    final Either<String, List<TaskEntity>> tasks =
        await getUnCompletedUseCase.call();
    final Either<String, DailyInformationEntity> dailyInfo =
        await getDailyInformationUseCase.call();

    tasks.fold(
      (l) => emit(FetchHomeDataFail()),
      (list) {
        dailyInfo.fold(
          (l) => emit(FetchHomeDataFail()),
          (item) => emit(FetchHomeDataSuccess(list, item)),
        );
      },
    );
  }
}
