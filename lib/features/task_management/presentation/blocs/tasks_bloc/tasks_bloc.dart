import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:pomodore/features/task_management/domain/entities/task_entity.dart';

import '../../../domain/entities/category_entity.dart';
import '../../../domain/usecases/add_category_usecase.dart';
import '../../../domain/usecases/add_task_usecase.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  final AddTaskUsecase addTaskUsecase;
  final AddCategoryUsecase addCategoryUsecase;

  TasksBloc({required this.addTaskUsecase, required this.addCategoryUsecase})
      : super(TasksInitial()) {
    on<TasksEvent>((event, emit) {});
    on<TaskAdded>((event, emit) async {
      emit(TaskAddLoading());

      Either<String, bool> result = await addTaskUsecase.call(event.data);
      result.fold((l) => emit(TaskAddFail()), (r) => emit(TaskAddSuccess()));
    });
    on<CategoryAdded>((event, emit) async {
      emit(CategoryAddLoading());

      Either<String, bool> result = await addCategoryUsecase.call(event.data);
      result.fold(
          (l) => emit(CategoryAddFail()), (r) => emit(CategoryAddSuccess()));
    });
  }
}
