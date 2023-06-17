import "package:dartz/dartz.dart";
import "package:pomodore/core/resources/params/task_params.dart";
import "package:pomodore/core/resources/usecase.dart";
import "package:pomodore/features/task_management/domain/repositories/task_repository.dart";

class AddTaskUsecase extends UseCase<Either<String, bool>, TaskParams> {
  final TaskRepository _repository;

  AddTaskUsecase(this._repository);

  @override
  Future<Either<String, bool>> call({TaskParams? params}) {
    return _repository.addTask(params!);
  }
}
