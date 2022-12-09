import 'package:dartz/dartz.dart';
import 'package:pomodore/core/resources/usecase.dart';
import 'package:pomodore/features/task_management/domain/entities/task_entity.dart';
import 'package:pomodore/features/task_management/domain/repositories/task_repository.dart';

class GetSpecificDateTasks
    extends UseCase<Either<String, List<TaskEntity>>, DateTime> {
  final TaskRepository taskRepository;

  GetSpecificDateTasks(this.taskRepository);

  @override
  Future<Either<String, List<TaskEntity>>> call(DateTime? params) {
    return taskRepository.getTaskByDate(params!);
  }
}
