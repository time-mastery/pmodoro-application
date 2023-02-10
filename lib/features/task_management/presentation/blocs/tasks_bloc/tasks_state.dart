part of 'tasks_bloc.dart';

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

class SpecificDateTasksReceivedSuccess extends TasksState {
  final List<TaskEntity> list;

  const SpecificDateTasksReceivedSuccess(this.list);

  @override
  List<Object?> get props => [list];
}

class SpecificDateTasksReceivedFailure extends TasksState {
  @override
  List<Object?> get props => [];
}

class SpecificDateTasksReceivedLoading extends TasksState {
  @override
  List<Object?> get props => [];
}

class CategoriesFetchSuccess extends TasksState {
  final List<CategoryEntity> list;

  const CategoriesFetchSuccess(this.list);

  @override
  List<Object?> get props => [list];
}

class CategoriesFetchFailure extends TasksState {
  @override
  List<Object?> get props => [];
}

class CategoriesFetchLoading extends TasksState {
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

class SaveCurrentPomodoroSuccess extends TasksState {
  const SaveCurrentPomodoroSuccess();

  @override
  List<Object?> get props => [];
}

class SaveCurrentPomodoroLoading extends TasksState {
  const SaveCurrentPomodoroLoading();

  @override
  List<Object?> get props => [];
}

class SaveCurrentPomodoroFailure extends TasksState {
  const SaveCurrentPomodoroFailure();

  @override
  List<Object?> get props => [];
}
