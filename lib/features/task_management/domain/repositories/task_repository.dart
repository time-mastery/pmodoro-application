import '../../../../core/resources/params/task_params.dart';

abstract class TaskRepository {
  Future addTask(TaskParams task);

  Future getTaskByDate(DateTime date);

  Future getTaskById(String id);

  Future deleteTask(String id);

  Future getCompletedTask();
}
