import 'package:dartz/dartz.dart';
import 'package:pomodore/features/task_management/domain/entities/task_entity.dart';

abstract class TaskRepository {
  Future<Either<String, bool>> addTask(TaskEntity task);

  Future<Either<String, List<TaskEntity>>> getTaskByDate(DateTime date);

  Future<Either<String, int?>> completeTask(TaskEntity taskEntity);

  Future<Either<String, int?>> deleteTask(String id);

  Future getTaskById(String id);

  Future getCompletedTask();
}
