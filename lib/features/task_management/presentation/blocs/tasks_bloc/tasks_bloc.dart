import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:pomodore/features/task_management/domain/entities/task_entity.dart';
import 'package:pomodore/features/task_management/domain/usecases/get_all_categories.dart';

import '../../../domain/entities/category_entity.dart';
import '../../../domain/usecases/add_category_usecase.dart';
import '../../../domain/usecases/add_task_usecase.dart';
import '../../../domain/usecases/get_specific_date_tasks.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  final AddTaskUsecase addTaskUsecase;
  final AddCategoryUsecase addCategoryUsecase;
  final GetSpecificDateTasks getSpecificDateTasks;
  final GetAllCategories getAllCategories;

  TasksBloc({
    required this.addTaskUsecase,
    required this.addCategoryUsecase,
    required this.getSpecificDateTasks,
    required this.getAllCategories,
  }) : super(TasksInitial()) {
    on<TasksEvent>((event, emit) {});
    on<TaskAdded>(_taskAdded);
    on<CategoryAdded>(_categoryAdded);
    on<SpecificDateTasksReceived>(_todayTasksReceived);
    on<CategoriesFetched>(_categoriesFetched);
  }

  _categoriesFetched(CategoriesFetched event, Emitter<TasksState> emit) async {
    emit(CategoriesFetchLoading());

    Either<String, List<CategoryEntity>> result = await getAllCategories.call();
    result.fold((l) => emit(CategoriesFetchFail()),
        (r) => emit(CategoriesFetchSuccess(r)));
  }

  _todayTasksReceived(
      SpecificDateTasksReceived event, Emitter<TasksState> emit) async {
    emit(SpecificDateTasksReceivedLoading());

    Either<String, List<TaskEntity>> result =
        await getSpecificDateTasks.call(params: event.data);
    result.fold((l) => emit(SpecificDateTasksReceivedFailure()),
        (r) => emit(SpecificDateTasksReceivedSuccess(r)));
  }

  _taskAdded(TaskAdded event, Emitter<TasksState> emit) async {
    emit(TaskAddLoading());

    Either<String, bool> result = await addTaskUsecase.call(params: event.data);
    result.fold((l) => emit(TaskAddFail()), (r) => emit(TaskAddSuccess()));
  }

  _categoryAdded(CategoryAdded event, Emitter<TasksState> emit) async {
    emit(CategoryAddLoading());

    Either<String, bool> result =
        await addCategoryUsecase.call(params: event.data);
    result.fold(
        (l) => emit(CategoryAddFail()), (r) => emit(CategoryAddSuccess()));
  }
}
