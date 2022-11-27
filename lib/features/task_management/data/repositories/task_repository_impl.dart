import 'package:pomodore/core/resources/params.dart';
import 'package:pomodore/features/task_management/domain/repositories/task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  @override
  Future addTask(TaskParams task) {
    // TODO: implement addTask
    throw UnimplementedError();
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
  Future getTaskByDate(DateTime date) {
    // TODO: implement getTaskByDate
    throw UnimplementedError();
  }

  @override
  Future getTaskById(String id) {
    // TODO: implement getTaskById
    throw UnimplementedError();
  }
}
