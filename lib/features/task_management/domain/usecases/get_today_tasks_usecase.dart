import "package:dartz/dartz.dart";
import "package:pomodore/core/resources/usecase.dart";
import "package:pomodore/features/task_management/domain/entities/task_entity.dart";
import "package:pomodore/features/task_management/domain/repositories/task_repository.dart";

class GetTodayTasksUseCase extends UseCase<Either<String, List<TaskEntity>>, DateTime> {
  final TaskRepository _taskRepository;

  GetTodayTasksUseCase(this._taskRepository);

  @override
  Future<Either<String, List<TaskEntity>>> call({DateTime? params}) {
    return _taskRepository.getTaskByDate(params!);
  }
}
