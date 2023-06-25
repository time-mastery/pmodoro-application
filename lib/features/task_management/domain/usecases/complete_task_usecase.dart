import "package:dartz/dartz.dart";
import "package:pomodore/core/resources/params/task_params.dart";
import "package:pomodore/core/resources/usecase.dart";
import "package:pomodore/features/task_management/domain/repositories/task_repository.dart";

class CompleteTaskUseCase extends UseCase<Either<String, String>, TaskParams> {
  final TaskRepository _taskRepository;

  CompleteTaskUseCase(this._taskRepository);

  @override
  Future<Either<String, String>> call({TaskParams? params}) {
    return _taskRepository.completeTask(params!);
  }
}
