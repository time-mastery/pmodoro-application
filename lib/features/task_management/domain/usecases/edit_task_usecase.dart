import 'package:dartz/dartz.dart';
import 'package:pomodore/core/resources/usecase.dart';
import 'package:pomodore/features/task_management/domain/entities/task_entity.dart';
import 'package:pomodore/features/task_management/domain/repositories/task_repository.dart';

class EditTaskUseCase extends UseCase<Either<String, String>, TaskEntity> {

  final TaskRepository taskRepository;

  EditTaskUseCase(this.taskRepository);

  @override
  Future<Either<String, String>> call({TaskEntity? params}) {
    return taskRepository.editTask(params!);
  }

}