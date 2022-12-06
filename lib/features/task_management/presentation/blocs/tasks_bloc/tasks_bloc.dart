import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pomodore/core/resources/data_state.dart';
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

      DataState result = await addTaskUsecase.call(event.data);
      if (result.error == null) {
        emit(TaskAddSuccess());
      } else {
        emit(TaskAddFail());
      }
    });
  }
}
