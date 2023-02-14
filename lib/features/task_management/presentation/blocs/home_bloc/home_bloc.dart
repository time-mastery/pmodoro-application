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
    on<HomeDataFetched>(_onFetchHomeData);
  }

  _onFetchHomeData(HomeDataFetched event, Emitter emit) async {
    emit(FetchHomeDataLoading());

    Either<String, List<TaskEntity>> tasks =
        await getTodayTasksUseCase.call(params: event.date);
    Either<String, DailyInformationEntity> dailyInfo =
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
