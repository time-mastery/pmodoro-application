import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:pomodore/features/task_management/domain/entities/task_entity.dart';
import 'package:pomodore/features/task_management/domain/usecases/get_all_categories_usecase.dart';

import '../../../domain/entities/category_entity.dart';
import '../../../domain/entities/pomodoro_entity.dart';
import '../../../domain/usecases/add_category_usecase.dart';
import '../../../domain/usecases/add_pomodoro_to_db_usecase.dart';
import '../../../domain/usecases/add_task_usecase.dart';
import '../../../domain/usecases/complete_task_usecase.dart';
import '../../../domain/usecases/delete_task_usecase.dart';
import '../../../domain/usecases/get_specific_date_tasks_usecase.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  final AddTaskUsecase addTaskUsecase;
  final AddCategoryUsecase addCategoryUsecase;
  final GetSpecificDateTasksUseCase getSpecificDateTasks;
  final GetAllCategoriesUseCase getAllCategories;
  final CompleteTaskUseCase completeTaskUseCase;
  final DeleteTaskUseCase deleteTaskUseCase;
  final AddPomodoroToDbUseCase addPomodoroToDbUseCase;

  TasksBloc({
    required this.addTaskUsecase,
    required this.addCategoryUsecase,
    required this.getSpecificDateTasks,
    required this.getAllCategories,
    required this.completeTaskUseCase,
    required this.deleteTaskUseCase,
    required this.addPomodoroToDbUseCase,
  }) : super(TasksInitial()) {
    on<TasksEvent>((event, emit) {});
    on<TaskAdded>(_taskAdded);
    on<CategoryAdded>(_categoryAdded);
    on<SpecificDateTasksReceived>(_todayTasksReceived);
    on<CategoriesFetched>(_categoriesFetched);
    on<TaskCompleted>(_taskCompleted);
    on<TaskDeleted>(_taskDeleted);
    on<CurrentPomodoroToDatabaseSaved>(_onCurrentPomodoroOnDatabaseSaved);
  }

  void saveCurrentPomodoroOnDatabase(PomodoroEntity item) =>
      addPomodoroToDbUseCase.call(params: item);

  void _onCurrentPomodoroOnDatabaseSaved(
      CurrentPomodoroToDatabaseSaved event, Emitter<TasksState> emit) async {
    emit(const SaveCurrentPomodoroLoading());

    Either<String, bool> result =
        await addPomodoroToDbUseCase.call(params: event.item);
    result.fold(
      (l) => const SaveCurrentPomodoroFail(),
      (r) => const SaveCurrentPomodoroSuccess(),
    );
  }

  _taskDeleted(TaskDeleted event, Emitter<TasksState> emit) async {
    emit(TaskDeleteLoading());

    Either<String, int?> result =
        await deleteTaskUseCase.call(params: event.id);
    result.fold(
      (l) => emit(TaskDeleteFail()),
      (r) => emit(TaskDeleteSuccess()),
    );
  }

  _taskCompleted(TaskCompleted event, Emitter<TasksState> emit) async {
    emit(TaskCompleteLoading());

    Either<String, int?> result =
        await completeTaskUseCase.call(params: event.taskEntity);

    result.fold(
      (l) => emit(TaskCompleteFail()),
      (r) => emit(TaskCompleteSuccess()),
    );
  }

  _categoriesFetched(CategoriesFetched event, Emitter<TasksState> emit) async {
    emit(CategoriesFetchLoading());

    Either<String, List<CategoryEntity>> result = await getAllCategories.call();
    result.fold(
      (l) => emit(CategoriesFetchFail()),
      (r) => emit(CategoriesFetchSuccess(r)),
    );
  }

  _todayTasksReceived(
      SpecificDateTasksReceived event, Emitter<TasksState> emit) async {
    emit(SpecificDateTasksReceivedLoading());

    Either<String, List<TaskEntity>> result =
        await getSpecificDateTasks.call(params: event.data);
    result.fold(
      (l) => emit(SpecificDateTasksReceivedFailure()),
      (r) => emit(SpecificDateTasksReceivedSuccess(r)),
    );
  }

  _taskAdded(TaskAdded event, Emitter<TasksState> emit) async {
    emit(TaskAddLoading());

    Either<String, bool> result = await addTaskUsecase.call(params: event.data);
    result.fold(
      (l) => emit(TaskAddFail()),
      (r) => emit(TaskAddSuccess()),
    );
  }

  _categoryAdded(CategoryAdded event, Emitter<TasksState> emit) async {
    emit(CategoryAddLoading());

    Either<String, bool> result =
        await addCategoryUsecase.call(params: event.data);
    result.fold(
      (l) => emit(CategoryAddFail()),
      (r) => emit(CategoryAddSuccess()),
    );
  }
}
