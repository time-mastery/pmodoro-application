import 'package:dartz/dartz.dart';
import 'package:pomodore/features/task_management/data/data_sources/tasks_local_data_source.dart';
import 'package:pomodore/features/task_management/data/models/pomodoro_model.dart';
import 'package:pomodore/features/task_management/data/models/task_model.dart';
import 'package:pomodore/features/task_management/domain/entities/pomodoro_entity.dart';
import 'package:pomodore/features/task_management/domain/repositories/task_repository.dart';

import '../../domain/entities/task_entity.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TasksLocalDataSource localDataSource;

  TaskRepositoryImpl(this.localDataSource);

  @override
  Future<Either<String, bool>> addTask(TaskEntity task) async {
    late Either<String, bool> result;

    bool state = await localDataSource.addTask(task);

    if (!state) {
      result = const Left("error");
    } else {
      result = const Right(true);
    }
    return result;
  }

  @override
  Future<Either<String, List<TaskEntity>>> getTaskByDate(DateTime date) async {
    late Either<String, List<TaskEntity>> result;

    List<Map<String, dynamic>>? rawList = await localDataSource.getAllTasks();

    if (rawList != null) {
      List<TaskEntity> list = TaskModel.parseRawList(rawList);
      result = Right(TaskModel.filterTodayTasksList(list, date));
    } else {
      result = const Left("error");
    }

    return result;
  }

  @override
  Future<Either<String, int?>> completeTask(TaskEntity taskEntity) async {
    late Either<String, int?> result;

    int? status = await localDataSource.completeTask(taskEntity);

    if (status != null) {
      result = Right(status);
    } else {
      result = const Left("error");
    }

    return result;
  }

  @override
  Future<Either<String, int?>> deleteTask(String id) async {
    late Either<String, int?> result;

    int? status = await localDataSource.deleteTask(id);

    if (status != null) {
      result = Right(status);
    } else {
      result = const Left("error");
    }

    return result;
  }

  @override
  Future<Either<String, List<PomodoroEntity>>> getAllPomodoros() async {
    late Either<String, List<PomodoroEntity>> result;

    List<Map<String, dynamic>>? rawList =
        await localDataSource.getAllPomodoroFromDb();

    if (rawList != null) {
      List<PomodoroEntity> convertedList = PomodoroModel.parseRawList(rawList);
      result = Right(PomodoroModel.filterTodayPomodoroList(
        convertedList,
        DateTime.now(),
      ));
    } else {
      result = const Left("error");
    }

    return result;
  }

  @override
  Future<Either<String, bool>> savePomodoroInDb(PomodoroEntity item) async {
    late Either<String, bool> result;

    bool status = await localDataSource.saveAPomodoroOnDb(item);

    if (status) {
      result = Right(status);
    } else {
      result = const Left("error");
    }

    return result;
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
