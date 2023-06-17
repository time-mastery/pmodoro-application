import "package:dartz/dartz.dart";
import "package:pomodore/core/resources/params/task_params.dart";
import "package:pomodore/core/resources/usecase.dart";
import "package:pomodore/features/task_management/domain/repositories/task_repository.dart";

class EditTaskUseCase extends UseCase<Either<String, String>, TaskParams> {
  final TaskRepository taskRepository;

  EditTaskUseCase(this.taskRepository);

  @override
  Future<Either<String, String>> call({TaskParams? params}) {
    return taskRepository.editTask(params!);
  }
}
