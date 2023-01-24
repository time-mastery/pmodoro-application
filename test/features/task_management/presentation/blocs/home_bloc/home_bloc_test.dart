import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pomodore/features/task_management/domain/entities/daily_information_entity.dart';
import 'package:pomodore/features/task_management/domain/usecases/get_daily_information_usecase.dart';
import 'package:pomodore/features/task_management/domain/usecases/get_today_tasks_usecase.dart';
import 'package:pomodore/features/task_management/presentation/blocs/home_bloc/home_bloc.dart';
import 'package:test/scaffolding.dart';

import 'home_bloc_test.mocks.dart';

@GenerateMocks([
  GetDailyInformationUseCase,
  GetTodayTasksUseCase,
  DailyInformationEntity,
])
Future<void> main() async {
  MockGetDailyInformationUseCase mockGetDailyInformationUseCase =
      MockGetDailyInformationUseCase();
  MockGetTodayTasksUseCase mockGetTodayTasksUseCase =
      MockGetTodayTasksUseCase();
  MockDailyInformationEntity item = MockDailyInformationEntity();
  DateTime time = DateTime.now();

  getBlocInstance() => HomeBloc(
        getDailyInformationUseCase: mockGetDailyInformationUseCase,
        getTodayTasksUseCase: mockGetTodayTasksUseCase,
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
