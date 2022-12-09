part of 'tasks_bloc.dart';

abstract class TasksEvent extends Equatable {
  const TasksEvent();
}

class TaskAdded extends TasksEvent {
  final TaskEntity data;

  const TaskAdded(this.data);

  @override
  List<Object?> get props => [data];

  @override
  String toString() => "Task Added : $data";
}

class CategoryAdded extends TasksEvent {
  final CategoryEntity data;

  const CategoryAdded(this.data);

  @override
  List<Object?> get props => [data];
}

class SpecificDateTasksReceived extends TasksEvent {
  final DateTime data;

  const SpecificDateTasksReceived(this.data);

  @override
  List<Object?> get props => [data];
}
