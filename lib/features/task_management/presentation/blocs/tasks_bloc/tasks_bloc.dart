import "package:bloc/bloc.dart";
import "package:dartz/dartz.dart";
import "package:equatable/equatable.dart";
import "package:pomodore/core/resources/enums/tasks_filter_enums.dart";
import "package:pomodore/core/resources/params/task_params.dart";
import "package:pomodore/features/task_management/domain/entities/task_entity.dart";
import "package:pomodore/features/task_management/domain/usecases/edit_task_usecase.dart";

import "../../../domain/usecases/add_task_usecase.dart";
import "../../../domain/usecases/complete_task_usecase.dart";
import "../../../domain/usecases/delete_task_usecase.dart";
import "../../../domain/usecases/get_all_tasks.dart";

part "tasks_event.dart";
part "tasks_state.dart";

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  final AddTaskUsecase addTaskUsecase;
  final CompleteTaskUseCase completeTaskUseCase;
  final DeleteTaskUseCase deleteTaskUseCase;
  final EditTaskUseCase editTaskUseCase;
  final GetAllTasksUseCase getAllTasksUseCase;

  TasksBloc({
    required this.addTaskUsecase,
    required this.completeTaskUseCase,
    required this.deleteTaskUseCase,
    required this.editTaskUseCase,
    required this.getAllTasksUseCase,
  }) : super(TasksInitial()) {
    on<TasksEvent>((event, emit) {});
    on<TaskAdded>(_taskAdded);
    on<AllTasksFetched>(_todayTasksFetched);
    on<TaskCompleted>(_taskCompleted);
    on<TaskDeleted>(_taskDeleted);
    on<DateAdded>(_dateAdded);
    on<TaskEdited>(_taskEdited);
    on<TasksFiltered>(_taskFiltered);
  }

  void _dateAdded(DateAdded event, Emitter emit) {
    emit(AddDateLoading());
    emit(AddDateSuccess(event.dateTime));
  }

  _taskFiltered(TasksFiltered event, emit) {
    List<TaskEntity> filteredList = [];

    if (event.filterMode == TasksFilterEnum.all) {
      emit(FilterTaskSuccess(list: event.list, index: 0));
    } else if (event.filterMode == TasksFilterEnum.unCompleted) {
      for (var element in event.list) {
        if (!element.done) filteredList.add(element);
      }
      emit(FilterTaskSuccess(list: filteredList, index: 1));
    } else {
      for (var element in event.list) {
        if (element.done) filteredList.add(element);
      }
      emit(FilterTaskSuccess(list: filteredList, index: 2));
    }
  }

  _taskEdited(TaskEdited event, Emitter emit) async {
    emit(EditTaskLoading());

    final Either<String, String> result =
        await editTaskUseCase.call(params: event.item);

    result.fold(
      (l) => emit(EditTaskFailure()),
      (r) => emit(EditTaskSuccess()),
    );
  }

  _taskDeleted(TaskDeleted event, Emitter<TasksState> emit) async {
    emit(TaskDeleteLoading());

    final Either<String, String> result =
        await deleteTaskUseCase.call(params: event.id);
    result.fold(
      (l) => emit(TaskDeleteFailure()),
      (r) => emit(TaskDeleteSuccess()),
    );
  }

  _taskCompleted(TaskCompleted event, Emitter<TasksState> emit) async {
    emit(TaskCompleteLoading());

    final Either<String, String> result =
        await completeTaskUseCase.call(params: event.taskEntity);

    result.fold(
      (l) => emit(TaskCompleteFailure()),
      (r) => emit(TaskCompleteSuccess()),
    );
  }

  _todayTasksFetched(AllTasksFetched event, Emitter<TasksState> emit) async {
    emit(GetAllTasksLoading());

    final Either<String, List<TaskEntity>> result =
        await getAllTasksUseCase.call();
    result.fold(
      (l) => emit(GetAllTasksFail()),
      (r) => emit(GetAllTasksSuccess(r)),
    );
  }

  _taskAdded(TaskAdded event, Emitter<TasksState> emit) async {
    emit(TaskAddLoading());

    final Either<String, bool> result =
        await addTaskUsecase.call(params: event.data);
    result.fold(
      (l) => emit(TaskAddFailure()),
      (r) => emit(TaskAddSuccess()),
    );
  }
}
