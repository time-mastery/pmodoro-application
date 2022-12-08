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

class TaskAddFail extends TasksState {
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

class CategoryAddFail extends TasksState {
  @override
  List<Object?> get props => [];
}
