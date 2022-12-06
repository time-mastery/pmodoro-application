import 'package:pomodore/core/resources/data_state.dart';
import 'package:pomodore/core/resources/usecase.dart';
import 'package:pomodore/features/task_management/domain/entities/task_entity.dart';
import 'package:pomodore/features/task_management/domain/repositories/task_repository.dart';

class AddTaskUsecase extends UseCase<DataState<bool>, TaskEntity> {
  final TaskRepository _repository;

  AddTaskUsecase(this._repository);

  @override
  Future<DataState<bool>> call(TaskEntity? params) {
    return _repository.addTask(params!);
  }
}
