import "package:dartz/dartz.dart";
import "package:pomodore/core/resources/params/no_params.dart";
import "package:pomodore/core/resources/usecase.dart";
import "package:pomodore/features/task_management/domain/entities/task_entity.dart";
import "package:pomodore/features/task_management/domain/repositories/task_repository.dart";

class GetUnCompletedTasksUseCase
    extends UseCase<Either<String, List<TaskEntity>>, NoParams> {
  final TaskRepository _taskRepository;

  GetUnCompletedTasksUseCase(this._taskRepository);

  @override
  Future<Either<String, List<TaskEntity>>> call({NoParams? params}) {
    return _taskRepository.getUnCompletedTasks();
  }
}
