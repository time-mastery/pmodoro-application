import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:pomodore/features/task_management/domain/entities/task_entity.dart';

import '../../../domain/usecases/add_task_usecase.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  final AddTaskUsecase addTaskUsecase;

  TasksBloc({required this.addTaskUsecase}) : super(TasksInitial()) {
    on<TasksEvent>((event, emit) {});
    on<TaskAdded>((event, emit) async {
      emit(TaskAddLoading());

      Either<bool, String> result = await addTaskUsecase.call(event.data);
      result.fold((l) => emit(TaskAddSuccess()), (r) => emit(TaskAddFail()));
    });
  }
}
