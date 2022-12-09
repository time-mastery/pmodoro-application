import 'package:dartz/dartz.dart';
import 'package:pomodore/features/task_management/data/data_sources/local_data_source.dart';
import 'package:pomodore/features/task_management/data/models/task_model.dart';
import 'package:pomodore/features/task_management/domain/repositories/task_repository.dart';

import '../../domain/entities/task_entity.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TasksLocalDataSource localDataSource;

  TaskRepositoryImpl(this.localDataSource);

  @override
  Future<Either<String, bool>> addTask(TaskEntity task) async {
    late Either<String, bool> result;

    bool state = await localDataSource.addTask(task);

    if (state) {
      result = const Left("error");
    } else {
      result = const Right(true);
    }
    return result;
  }

  @override
  Future<Either<String, List<TaskEntity>>> getTaskByDate(DateTime date) async {
    late Either<String, List<TaskEntity>> result;

    List<Map<String, dynamic>>? rawList =
        await localDataSource.getTaskByDate(date);

    if (rawList != null) {
      List<TaskEntity> list = TaskModel.parseRawList(rawList);
      result = Right(list);
    } else {
      result = const Left("error");
    }

    return result;
  }

  @override
  Future deleteTask(String id) {
    // TODO: implement deleteTask
    throw UnimplementedError();
  }

  @override
  Future getCompletedTask() {
    // TODO: implement getCompletedTask
    throw UnimplementedError();
  }

  @override
  Future getTaskById(String id) {
    // TODO: implement getTaskById
    throw UnimplementedError();
  }
}
