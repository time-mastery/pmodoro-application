import "package:bloc_test/bloc_test.dart";
import "package:dartz/dartz.dart";
import "package:mockito/annotations.dart";
import "package:mockito/mockito.dart";
import "package:pomodore/features/task_management/domain/entities/daily_information_entity.dart";
import "package:pomodore/features/task_management/domain/usecases/check_daily_goal_usecase.dart";
import "package:pomodore/features/task_management/domain/usecases/get_daily_information_usecase.dart";
import "package:pomodore/features/task_management/domain/usecases/get_today_tasks_usecase.dart";
import "package:pomodore/features/task_management/domain/usecases/save_daily_goal_usecase.dart";
import "package:pomodore/features/task_management/presentation/blocs/home_bloc/home_bloc.dart";
import "package:test/scaffolding.dart";

import "home_bloc_test.mocks.dart";

@GenerateMocks([
  GetDailyInformationUseCase,
  GetTodayTasksUseCase,
  DailyInformationEntity,
  CheckDailyGoalUseCase,
  SaveDailyGoalUseCase,
])
Future<void> main() async {
  final MockGetDailyInformationUseCase mockGetDailyInformationUseCase =
      MockGetDailyInformationUseCase();
  final MockGetTodayTasksUseCase mockGetTodayTasksUseCase =
      MockGetTodayTasksUseCase();
  final MockDailyInformationEntity item = MockDailyInformationEntity();
  final MockCheckDailyGoalUseCase mockCheckDailyGoalUseCase =
      MockCheckDailyGoalUseCase();
  final MockSaveDailyGoalUseCase mockSaveDailyGoalUseCase =
      MockSaveDailyGoalUseCase();
  final DateTime time = DateTime.now();

  HomeBloc getBlocInstance() => HomeBloc(
        getDailyInformationUseCase: mockGetDailyInformationUseCase,
        getTodayTasksUseCase: mockGetTodayTasksUseCase,
        checkDailyGoalUseCase: mockCheckDailyGoalUseCase,
        saveDailyGoalUseCase: mockSaveDailyGoalUseCase,
      );

  blocTest(
    "emit nothing when nothing added",
    build: () => getBlocInstance(),
    expect: () => [],
  );
  group(
    "HomeDataFetched events",
    () {
      blocTest(
        "emit FetchHomeDataSuccess when HomeDataFetched added",
        build: () {
          when(mockGetTodayTasksUseCase.call(params: time))
              .thenAnswer((_) async => Future.value(const Right([])));
          when(mockGetDailyInformationUseCase.call())
              .thenAnswer((_) async => Future.value(Right(item)));

          return getBlocInstance();
        },
        act: (bloc) => bloc.add(HomeDataFetched(time)),
        expect: () => [
          FetchHomeDataLoading(),
          FetchHomeDataSuccess(const [], item),
        ],
      );
    },
  );
}
