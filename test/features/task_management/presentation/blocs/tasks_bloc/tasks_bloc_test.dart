import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pomodore/features/task_management/domain/entities/pomodoro_entity.dart';
import 'package:pomodore/features/task_management/domain/entities/task_entity.dart';
import 'package:pomodore/features/task_management/domain/usecases/add_category_usecase.dart';
import 'package:pomodore/features/task_management/domain/usecases/add_pomodoro_to_db_usecase.dart';
import 'package:pomodore/features/task_management/domain/usecases/add_task_usecase.dart';
import 'package:pomodore/features/task_management/domain/usecases/complete_task_usecase.dart';
import 'package:pomodore/features/task_management/domain/usecases/delete_task_usecase.dart';
import 'package:pomodore/features/task_management/domain/usecases/get_all_categories_usecase.dart';
import 'package:pomodore/features/task_management/domain/usecases/get_specific_date_tasks_usecase.dart';
import 'package:pomodore/features/task_management/presentation/blocs/tasks_bloc/tasks_bloc.dart';

import 'tasks_bloc_test.mocks.dart';

@GenerateMocks([
  AddTaskUsecase,
  AddCategoryUsecase,
  GetSpecificDateTasksUseCase,
  GetAllCategoriesUseCase,
  CompleteTaskUseCase,
  DeleteTaskUseCase,
  AddPomodoroToDbUseCase,
  TaskEntity,
  PomodoroEntity,
])
void main() {
  MockAddTaskUsecase mockAddTaskUsecase = MockAddTaskUsecase();
  MockGetSpecificDateTasksUseCase mockGetSpecificDateTasksUseCase =
      MockGetSpecificDateTasksUseCase();
  MockCompleteTaskUseCase mockCompleteTaskUseCase = MockCompleteTaskUseCase();
  MockDeleteTaskUseCase mockDeleteTaskUseCase = MockDeleteTaskUseCase();
  MockAddPomodoroToDbUseCase mockAddPomodoroToDbUseCase =
      MockAddPomodoroToDbUseCase();
  MockAddCategoryUsecase mockAddCategoryUsecase = MockAddCategoryUsecase();
  MockGetAllCategoriesUseCase mockGetAllCategoriesUseCase =
      MockGetAllCategoriesUseCase();

  MockTaskEntity taskEntity = MockTaskEntity();
  MockPomodoroEntity pomodoroEntity = MockPomodoroEntity();

  getBlocInstance() => TasksBloc(
        addTaskUsecase: mockAddTaskUsecase,
        addCategoryUsecase: mockAddCategoryUsecase,
        getSpecificDateTasks: mockGetSpecificDateTasksUseCase,
        getAllCategories: mockGetAllCategoriesUseCase,
        completeTaskUseCase: mockCompleteTaskUseCase,
        deleteTaskUseCase: mockDeleteTaskUseCase,
        addPomodoroToDbUseCase: mockAddPomodoroToDbUseCase,
      );

  group("TaskAdded Event", () {
    group("TaskAdded Success Test", () {
      blocTest(
        "emit TaskLoading and TaskAddSuccess state",
        build: () {
          when(mockAddTaskUsecase.call(params: taskEntity))
              .thenAnswer((_) async => Future.value(const Right(true)));

          return getBlocInstance();
        },
        act: (bloc) => bloc.add(TaskAdded(taskEntity)),
        expect: () => [
          TaskAddLoading(),
          TaskAddSuccess(),
        ],
      );
    });
    group("TaskAdded Fail Test", () {
      blocTest(
        "emit TaskLoading and TaskAddSuccess state",
        build: () {
          when(mockAddTaskUsecase.call(params: taskEntity))
              .thenAnswer((_) async => Future.value(const Left("error")));

          return getBlocInstance();
        },
        act: (bloc) => bloc.add(TaskAdded(taskEntity)),
        expect: () => [
          TaskAddLoading(),
          TaskAddFail(),
        ],
      );
    });
  });

  group("TaskCompleted Event Test", () {
    group("TaskCompleted Success Event Test ", () {
      blocTest(
        "emit TaskCompleteLoading and TaskCompleteSuccess state",
        build: () {
          when(mockCompleteTaskUseCase.call(params: taskEntity))
              .thenAnswer((_) async => Future.value(const Right(1)));
          return getBlocInstance();
        },
        act: (bloc) => bloc.add(TaskCompleted(taskEntity)),
        expect: () => [
          TaskCompleteLoading(),
          TaskCompleteSuccess(),
        ],
      );
    });
    group("TaskCompleted Fail Event Test ", () {
      blocTest(
        "emit TaskCompleteLoading and TaskCompleteFail state",
        build: () {
          when(mockCompleteTaskUseCase.call(params: taskEntity))
              .thenAnswer((_) async => Future.value(const Left("error")));
          return getBlocInstance();
        },
        act: (bloc) => bloc.add(TaskCompleted(taskEntity)),
        expect: () => [
          TaskCompleteLoading(),
          TaskCompleteFail(),
        ],
      );
    });
  });
  group("TaskDeleted Event Test", () {
    group("TaskDeleted Success Event Test", () {
      blocTest(
        "emit TaskDeleteLoading and TaskDeleteSuccess state",
        build: () {
          when(mockDeleteTaskUseCase.call(params: "xx2"))
              .thenAnswer((_) async => Future.value(const Right(1)));
          return getBlocInstance();
        },
        act: (bloc) => bloc.add(const TaskDeleted("xx2")),
        expect: () => [
          TaskDeleteLoading(),
          TaskDeleteSuccess(),
        ],
      );
    });
    group("TaskDeleted Fail Event Test", () {
      blocTest(
        "emit TaskDeleteLoading and TaskDeleteFail state",
        build: () {
          when(mockDeleteTaskUseCase.call(params: "xx2"))
              .thenAnswer((_) async => Future.value(const Left("error")));
          return getBlocInstance();
        },
        act: (bloc) => bloc.add(const TaskDeleted("xx2")),
        expect: () => [
          TaskDeleteLoading(),
          TaskDeleteFail(),
        ],
      );
    });
  });
  group("CurrentPomodoroToDatabaseSaved Event Test", () {
    group("CurrentPomodoroToDatabaseSaved Success Event Test", () {
      blocTest(
        "emit SaveCurrentPomodoroLoading and SaveCurrentPomodoroSuccess state",
        build: () {
          when(mockAddPomodoroToDbUseCase.call(params: pomodoroEntity))
              .thenAnswer((_) async => Future.value(const Right(true)));
          return getBlocInstance();
        },
        act: (bloc) => bloc.add(CurrentPomodoroToDatabaseSaved(pomodoroEntity)),
        expect: () => [
          const SaveCurrentPomodoroLoading(),
          const SaveCurrentPomodoroSuccess(),
        ],
      );
    });
    group("CurrentPomodoroToDatabaseSaved Fail Event Test", () {
      blocTest(
        "emit SaveCurrentPomodoroLoading and SaveCurrentPomodoroFail state",
        build: () {
          when(mockAddPomodoroToDbUseCase.call(params: pomodoroEntity))
              .thenAnswer((_) async => Future.value(const Left("error")));
          return getBlocInstance();
        },
        act: (bloc) => bloc.add(CurrentPomodoroToDatabaseSaved(pomodoroEntity)),
        expect: () => [
          const SaveCurrentPomodoroLoading(),
          const SaveCurrentPomodoroFail(),
        ],
      );
    });
  });
}
