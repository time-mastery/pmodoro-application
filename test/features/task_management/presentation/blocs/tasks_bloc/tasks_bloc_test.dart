import "package:bloc_test/bloc_test.dart";
import "package:dartz/dartz.dart";
import "package:flutter_test/flutter_test.dart";
import "package:mockito/annotations.dart";
import "package:mockito/mockito.dart";
import "package:pomodore/core/resources/params/task_params.dart";
import "package:pomodore/features/task_management/domain/usecases/add_pomodoro_to_db_usecase.dart";
import "package:pomodore/features/task_management/domain/usecases/add_task_usecase.dart";
import "package:pomodore/features/task_management/domain/usecases/complete_task_usecase.dart";
import "package:pomodore/features/task_management/domain/usecases/delete_task_usecase.dart";
import "package:pomodore/features/task_management/domain/usecases/edit_task_usecase.dart";
import "package:pomodore/features/task_management/domain/usecases/get_all_tasks.dart";
import "package:pomodore/features/task_management/presentation/blocs/tasks_bloc/tasks_bloc.dart";

import "tasks_bloc_test.mocks.dart";

@GenerateMocks([
  AddTaskUsecase,
  GetAllTasksUseCase,
  CompleteTaskUseCase,
  DeleteTaskUseCase,
  AddPomodoroToDbUseCase,
  EditTaskUseCase,
  TaskParams,
])
void main() {
  final MockAddTaskUsecase mockAddTaskUsecase = MockAddTaskUsecase();
  final MockGetAllTasksUseCase mockGetAllTasksUseCase =
      MockGetAllTasksUseCase();
  final MockCompleteTaskUseCase mockCompleteTaskUseCase =
      MockCompleteTaskUseCase();
  final MockDeleteTaskUseCase mockDeleteTaskUseCase = MockDeleteTaskUseCase();
  final MockEditTaskUseCase mockEditTaskUseCase = MockEditTaskUseCase();

  final MockTaskParams taskEntity = MockTaskParams();

  TasksBloc getBlocInstance() => TasksBloc(
        addTaskUsecase: mockAddTaskUsecase,
        getAllTasksUseCase: mockGetAllTasksUseCase,
        completeTaskUseCase: mockCompleteTaskUseCase,
        deleteTaskUseCase: mockDeleteTaskUseCase,
        editTaskUseCase: mockEditTaskUseCase,
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
          TaskAddFailure(),
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
              .thenAnswer((_) async => Future.value(const Right("1")));
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
          TaskCompleteFailure(),
        ],
      );
    });
  });
  group("TaskDeleted Event Test", () {
    group("TaskDeleted Success Event Test", () {
      blocTest(
        "emit TaskDeleteLoading and TaskDeleteSuccess state",
        build: () {
          when(mockDeleteTaskUseCase.call(params: 2))
              .thenAnswer((_) async => Future.value(const Right("1")));
          return getBlocInstance();
        },
        act: (bloc) => bloc.add(const TaskDeleted(2)),
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
          when(mockDeleteTaskUseCase.call(params: 2))
              .thenAnswer((_) async => Future.value(const Left("error")));
          return getBlocInstance();
        },
        act: (bloc) => bloc.add(const TaskDeleted(2)),
        expect: () => [
          TaskDeleteLoading(),
          TaskDeleteFailure(),
        ],
      );
    });
  });
}
