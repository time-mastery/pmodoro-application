import "package:dartz/dartz.dart";
import "package:pomodore/core/resources/usecase.dart";
import "package:pomodore/features/task_management/domain/entities/task_entity.dart";
import "package:pomodore/features/task_management/domain/repositories/task_repository.dart";

class AddTaskUsecase extends UseCase<Either<String, bool>, TaskEntity> {
  final TaskRepository _repository;

  AddTaskUsecase(this._repository);

  @override
  Future<Either<String, bool>> call({TaskEntity? params}) {
    return _repository.addTask(params!);
  }
}
