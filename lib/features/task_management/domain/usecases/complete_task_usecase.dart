import 'package:dartz/dartz.dart';
import 'package:pomodore/core/resources/usecase.dart';
import 'package:pomodore/features/task_management/domain/entities/task_entity.dart';
import 'package:pomodore/features/task_management/domain/repositories/task_repository.dart';

class CompleteTaskUseCase extends UseCase<Either<String, String>, TaskEntity> {
  final TaskRepository _taskRepository;

  CompleteTaskUseCase(this._taskRepository);

  @override
  Future<Either<String, String>> call({TaskEntity? params}) {
    return _taskRepository.completeTask(params!);
  }
}
