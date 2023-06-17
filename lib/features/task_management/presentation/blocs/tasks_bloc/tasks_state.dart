part of "tasks_bloc.dart";

abstract class TasksState extends Equatable {
  const TasksState();
}

class TasksInitial extends TasksState {
  @override
  List<Object> get props => [];
}

class TaskAddSuccess extends TasksState {
  @override
  List<Object?> get props => [];
}

class TaskAddFailure extends TasksState {
  @override
  List<Object?> get props => [];
}

class TaskAddLoading extends TasksState {
  @override
  List<Object?> get props => [];
}

class CategoryAddSuccess extends TasksState {
  @override
  List<Object?> get props => [];
}

class CategoryAddLoading extends TasksState {
  @override
  List<Object?> get props => [];
}

class CategoryAddFailure extends TasksState {
  @override
  List<Object?> get props => [];
}

class GetAllTasksSuccess extends TasksState {
  final List<TaskEntity> list;

  const GetAllTasksSuccess(this.list);

  @override
  List<Object?> get props => [list];
}

class GetAllTasksFail extends TasksState {
  @override
  List<Object?> get props => [];
}

class GetAllTasksLoading extends TasksState {
  @override
  List<Object?> get props => [];
}

class TaskCompleteSuccess extends TasksState {
  @override
  List<Object?> get props => [];
}

class TaskCompleteFailure extends TasksState {
  @override
  List<Object?> get props => [];
}

class TaskCompleteLoading extends TasksState {
  @override
  List<Object?> get props => [];
}

class TaskDeleteSuccess extends TasksState {
  @override
  List<Object?> get props => [];
}

class TaskDeleteFailure extends TasksState {
  @override
  List<Object?> get props => [];
}

class TaskDeleteLoading extends TasksState {
  @override
  List<Object?> get props => [];
}

class AddDateLoading extends TasksState {
  @override
  List<Object?> get props => [];
}

class AddDateSuccess extends TasksState {
  final DateTime dateTime;

  const AddDateSuccess(this.dateTime);

  @override
  List<Object?> get props => [dateTime];
}

class EditTaskLoading extends TasksState {
  @override
  List<Object?> get props => [];
}

class EditTaskSuccess extends TasksState {
  @override
  List<Object?> get props => [];
}

class EditTaskFailure extends TasksState {
  @override
  List<Object?> get props => [];
}

class FilterTaskSuccess extends TasksState {
  final List<TaskEntity> list;
  final int index;

  const FilterTaskSuccess({required this.list, required this.index});

  @override
  List<Object?> get props => [list, index];
}
