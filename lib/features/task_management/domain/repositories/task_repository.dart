import 'package:pomodore/core/resources/params.dart';

abstract class TaskRepository {
  Future addTask(TaskParams task);

  Future getTaskByDate(DateTime date);

  Future getTaskById(String id);

  Future deleteTask(String id);

  Future getCompletedTask();
}
